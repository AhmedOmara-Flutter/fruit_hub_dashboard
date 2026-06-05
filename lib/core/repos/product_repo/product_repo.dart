import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductEntity);
  Future<Either<Failure, void>> updateProduct(ProductEntity productEntity);
  Future<void> deleteProduct(String productId);
  Future<Either<Failure, List<ProductEntity>>> getProducts();

}
