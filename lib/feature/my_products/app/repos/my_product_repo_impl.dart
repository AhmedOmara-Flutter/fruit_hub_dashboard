import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/domain/repos/my_product_repo.dart';

class MyProductRepoImpl implements MyProductRepo {
  final DatabaseServices _databaseServices;

  MyProductRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, List<ProductEntity>>> getFilteredProducts(
    String category,
  ) async {
    try {
      final result = await _databaseServices.getData(
        path: 'products',
        query: {'where': 'category', 'isEqualTo': category},
      ) as List<Map<String, dynamic>>;

      List<ProductEntity> products = result
          .map((product) => ProductModel.fromJson(product).toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      print('error from getFilteredProducts is $e');
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
