import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';

import '../../entities/order_entity.dart';
import '../../models/order_model.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
}

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseServices _databaseServices;

  OrdersRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final data =
      await _databaseServices.getData(path: 'orders')
      as List<Map<String, dynamic>>;
      List<OrderEntity> orders = data
          .map((user) => OrderModel.fromJson(user).toEntity())
          .toList();
      return Right(orders);
    } catch (e) {
      print('error from get orders is ${e.toString()}');
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
