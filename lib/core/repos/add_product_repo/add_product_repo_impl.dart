import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/data_source/database_remote_data_source.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/models/add_product_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';

import 'add_product_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DatabaseRemoteDataSourceImpl _databaseRemoteDataSource;

  AddProductRepoImpl(this._databaseRemoteDataSource);

  @override
  Future<Either<Failure, void>> addProduct(
      AddProductEntity addProductEntity) async {
    try {
      var result=await _databaseRemoteDataSource.addData(
        path: 'products', data: AddProductModel.fromEntity(addProductEntity).toJson(),);
      return Right(result);

    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));

    }

  }
}