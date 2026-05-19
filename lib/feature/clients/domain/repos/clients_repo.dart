import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';

abstract class ClientsRepo {
  Future<Either<Failure,List<UserEntity>>>getClients();
}