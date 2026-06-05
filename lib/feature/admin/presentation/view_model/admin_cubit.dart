import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/order_entity.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/repos/product_repo/product_repo.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this._productRepo, this._ordersRepo) : super(AdminInitial());
  final ProductRepo _productRepo;
  final OrdersRepo _ordersRepo;

  List<ProductEntity> products = [];
  List<OrderEntity> orders = [];
  Map<String, UserEntity> users = {};
  Future<List<ProductEntity>> getProducts() async {
    emit(GetProductsLoading());
    final result = await _productRepo.getProducts();
    return result.fold(
      (f) {
        print(f.errMessage);
        emit(GetProductsError(f.errMessage));
        return [];
      },
      (data) {
        products = data;
        emit(GetProductsSuccess());
        return products;
      },
    );
  }

  double totalSales = 0;

  Future<void> getTotalOrders() async {
    final result = await _ordersRepo.getOrders();

    result.fold(
      (failure) {
        emit(GetProductsError(failure.errMessage));
      },
      (data) {
        totalSales = data.fold(
          0.0,
          (sum, order) =>
              sum +
              order.cartEntity.cartItems.fold(
                0.0,
                (cartSum, item) => cartSum + item.totalPrice,
              ),
        );

        emit(GetProductsSuccess());
      },
    );
  }

  Future<void> getOrders() async {
    final result = await _ordersRepo.getOrders();

    result.fold(
          (failure) {
        emit(GetOrdersError(failure.errMessage));
      },
          (data) {
        orders = data;
        orders.map((e){
          return e.uId;

        });
        orders.sort(
              (a, b) => b.createdAt!.compareTo(a.createdAt!),
        );

        emit(GetOrdersSuccess(orders));
      },
    );
  }


  List<OrderEntity> get recentOrders =>
      orders.take(3).toList();

}