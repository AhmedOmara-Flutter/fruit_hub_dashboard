import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/order_entity.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../generated/assets.dart';
import '../widgets/best_seller_list_view.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this._productRepo, this._ordersRepo) : super(AdminInitial());
  final ProductRepo _productRepo;
  final OrdersRepo _ordersRepo;
  final List medals = [
    Assets.images.medal.path,
    Assets.images.medal1.path,
    Assets.images.medal2.path,
  ];
  List<ProductEntity> products = [];
  List<OrderEntity> orders = [];
  Map<String, UserEntity> users = {};

  StreamSubscription? _ordersSubscription;

  Future<void> loadDashboard() async {
    emit(DashboardLoading());

    await getProducts();
    getOrders();
  }
  Future<List<ProductEntity>> getProducts() async {
    final result = await _productRepo.getProducts();
    return result.fold(
      (f) {

        print(f.errMessage);
        return [];
      },
      (data) {
        print('PRODUCTS LOADED => ${data.length}');

        products = data;
        return products;
      },
    );
  }

  double totalSales = 0;

  void getOrders() {
    _ordersSubscription?.cancel();

    _ordersSubscription = _ordersRepo.getOrders().listen((res) {
      res.fold(
            (failure) {
          emit(DashboardError(failure.errMessage));
        },
            (data) {
          orders = data;

          orders.sort(
                (a, b) => b.createdAt!.compareTo(a.createdAt!),
          );

          totalSales = orders.fold(
            0.0,
                (sum, order) =>
            sum +
                order.cartEntity.cartItems.fold(
                  0.0,
                      (cartSum, item) => cartSum + item.totalPrice,
                ),
          );

          emit(DashboardSuccess());
        },
      );
    });
  }


  List<OrderEntity> get recentOrders =>
      orders.take(3).toList();


  List<TopProduct> get topProducts {
    final Map<String, TopProduct> products = {};
    for (var order in orders) {
      for (var item in order.cartEntity.cartItems) {
        final name = item.product.name;
        if (products.containsKey(name)) {
          products[name] = TopProduct(
            name: name,
            image: item.product.image!,
            totalOrders: products[name]!.totalOrders + item.quantity,
          );
        } else {
          products[name] = TopProduct(
            name: name,
            image: item.product.image!,
            totalOrders: item.quantity,
          );
        }
      }
    }

    final result = products.values.toList();

    result.sort(
          (a, b) => b.totalOrders.compareTo(a.totalOrders),
    );

    return result;
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}