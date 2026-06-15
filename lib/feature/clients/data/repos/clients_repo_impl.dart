import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/models/user_model.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/feature/clients/domain/repos/clients_repo.dart';

class ClientsRepoImpl implements ClientsRepo {
  final DatabaseServices _databaseServices;

  ClientsRepoImpl(this._databaseServices);

  @override
  Stream<Either<Failure, List<UserEntity>>> getClients() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>)
          in _databaseServices.getStreamData(path: 'users')) {
        List<UserEntity> clients = data
            .map((user) => UserModel.fromJson(user).toEntity())
            .toList();
        yield Right(clients);
      }
    } catch (e) {
      print('error from get clients is ${e.toString()}');
      yield Left(Failure(errMessage: e.toString()));
    }
  }
}
