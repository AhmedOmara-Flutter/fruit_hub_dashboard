import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/order_entity.dart';
import '../../../../core/models/top_product_model.dart';
import '../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../../generated/assets.dart';
import '../../enums/order_enum.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._ordersRepo) : super(OrdersInitial());
  final OrdersRepo _ordersRepo;
  double totalSales = 0;
  StreamSubscription? _ordersSubscription;
  List<OrderEntity> allOrders = [];
  List<OrderEntity> filteredOrders = [];
  OrderStatus? currentFilter;

  final List medals = [
    Assets.images.medal.path,
    Assets.images.medal1.path,
    Assets.images.medal2.path,
  ];

  void getOrders() {
    emit(GetOrdersLoadingState());

    _ordersSubscription?.cancel();
    _ordersSubscription = _ordersRepo.getOrders().listen((res) {
      res.fold(
        (failure) {
          emit(GetOrdersErrorState(failure.errMessage));
        },
        (data) {
          final newOrders = List<OrderEntity>.from(data)
            ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
          allOrders = newOrders;

          if (currentFilter == null) {
            filteredOrders = List.from(allOrders);
          } else {
            filteredOrders = allOrders
                .where((o) => o.status == currentFilter)
                .toList();
          }
          totalSales = allOrders.fold(
            0.0,
            (sum, order) =>
                sum +
                order.cartEntity.cartItems.fold(
                  0.0,
                  (cartSum, item) => cartSum + item.totalPrice,
                ),
          );

          emit(GetOrdersSuccessState());
        },
      );
    });
  }

  void filterByStatus(OrderStatus status) {
    currentFilter = status;

    filteredOrders = allOrders
        .where((order) => order.status == status)
        .toList();

    emit(GetOrdersSuccessState());
  }

  List<OrderEntity> get recentOrders => allOrders.take(3).toList();

  List<TopProductModel> get topProducts {
    final Map<String, TopProductModel> products = {};
    for (var order in allOrders) {
      for (var item in order.cartEntity.cartItems) {
        final name = item.product.name;
        if (products.containsKey(name)) {
          products[name] = TopProductModel(
            name: name,
            image: item.product.image!,
            totalOrders: products[name]!.totalOrders + item.quantity,
          );
        } else {
          products[name] = TopProductModel(
            name: name,
            image: item.product.image!,
            totalOrders: item.quantity,
          );
        }
      }
    }

    final result = products.values.toList();

    result.sort((a, b) => b.totalOrders.compareTo(a.totalOrders));

    return result;
  }

  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  }) async {
    emit(UpdateOrderLoadingState());

    final result = await _ordersRepo.updateOrderStatus(
      orderId: orderId,
      status: status,
    );

    result.fold(
          (failure) {
        emit(UpdateOrderErrorState(failure.errMessage));
      },
          (_) {
        final index = allOrders.indexWhere((e) => e.id == orderId);
        if (index != -1) {
          final updatedOrder = allOrders[index].copyWith(status: status);

          allOrders[index] = updatedOrder;
          filteredOrders =
              allOrders.where((o) {
                if (currentFilter == null) return true;
                return o.status == currentFilter;
              }).toList();        }
        if (currentFilter == null) {
          showAllOrders();
        } else {
          filterByStatus(currentFilter!);
        }

        emit(UpdateOrderSuccessState());
      },
    );
  }

  void showAllOrders() {
    currentFilter = null;

    filteredOrders = List.from(allOrders);

    emit(GetOrdersSuccessState());
  }

  double get totalDeliveryCost {
    return allOrders.fold(
      0.0,
      (sum, order) => sum + (order.selectedLocationEntity?.cost ?? 0),
    );
  }

  double get totalPriceWithDelivery {
    return totalSales + totalDeliveryCost;
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
