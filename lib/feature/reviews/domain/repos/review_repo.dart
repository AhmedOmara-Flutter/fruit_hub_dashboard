import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';

import '../../../add_product/domain/entities/product_entity.dart';
import '../entities/review_entity.dart';

abstract class ReviewRepo {
  Future<Either<Failure, List<ReviewEntity>>> getReviews({required String productId});

  Future<Either<Failure, List<ProductEntity>>> getProductsWithReviews();
}
