import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

import '../../services/storage_services.dart';
import 'add_product_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DatabaseServices _databaseServices;


  AddProductRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductEntity) async {
    try {
      var result = await _databaseServices.addData(
        path: 'products', data: ProductModel.fromEntity(addProductEntity).toJson(),);
      return Right(result);

    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }

  }
}