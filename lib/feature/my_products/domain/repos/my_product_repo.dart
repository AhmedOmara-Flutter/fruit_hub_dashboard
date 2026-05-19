import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

abstract class MyProductRepo {
  Future<Either<Failure,List<ProductEntity>>>getFilteredProducts(String category);
}