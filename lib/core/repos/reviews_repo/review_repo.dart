import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';

import '../../entities/product_entity.dart';
import '../../../feature/reviews/domain/entities/review_entity.dart';

abstract class ReviewRepo {
  Stream<Either<Failure, List<ReviewEntity>>> getReviews({required String productId});

  Stream<Either<Failure, List<ProductEntity>>> getProductsWithReviews();
}
