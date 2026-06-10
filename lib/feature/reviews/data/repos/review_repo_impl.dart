import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/feature/reviews/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/feature/reviews/domain/entities/review_entity.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/entities/product_entity.dart';
import '../../domain/repos/review_repo.dart';

class ReviewRepoImpl implements ReviewRepo {
  final DatabaseServices _databaseServices;

  ReviewRepoImpl(this._databaseServices);

  Future<Either<Failure, List<ProductEntity>>>
  getProductsWithReviews() async {
    try {
      final products = await _databaseServices.getData(
        path: 'products',
      );

      final productsWithReviews = (products as List<Map<String, dynamic>>)
          .where((product) => (product['reviewsCount'] ?? 0) > 0)
          .map<ProductEntity>(
            (e) => ProductModel.fromJson(e).toEntity(),
      )
          .toList();

      return Right(productsWithReviews);
    } catch (e) {
      return Left(
        ServerFailure(errMessage: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews({required String productId}) async {
    try {
      final data =
          await _databaseServices.getData(path: 'products/${productId}/reviews')
              as List<Map<String, dynamic>>;
      final reviews = data
          .map((e) => ReviewModel.fromJson(e).toEntity())
          .toList();
      print('reviews length: ${reviews.length}');
      return Right(reviews);
    } on Exception catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
