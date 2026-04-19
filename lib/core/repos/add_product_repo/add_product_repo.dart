import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductEntity);
}
