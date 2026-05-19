import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/models/user_model.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';
import 'package:fruit_hub_dashboard/feature/clients/domain/repos/clients_repo.dart';

class ClientsRepoImpl implements ClientsRepo {
  final DatabaseServices _databaseServices;

  ClientsRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, List<UserEntity>>> getClients() async {
    try {
      final data =
          await _databaseServices.getData(path: 'users')
              as List<Map<String, dynamic>>;
      List<UserEntity> clients = data
          .map((user) => UserModel.fromJson(user).toEntity())
          .toList();
      return Right(clients);
    } catch (e) {
      print('error from get clients is ${e.toString()}');
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
