import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub_dashboard/feature/clients/domain/repos/clients_repo.dart';
import 'package:meta/meta.dart';
part 'clients_state.dart';

class ClientsCubit extends Cubit<ClientsState> {
  ClientsCubit(this._clientsRepo, this._ordersRepo,)
      : super(ClientsInitial());

  final ClientsRepo _clientsRepo;
  final OrdersRepo _ordersRepo;
  List<UserEntity> clients = [];
  List<OrderEntity> orders = [];
  List<UserEntity> filteredClients = [];

  Future<void> loadData() async {
    emit(GetClientsLoading());

    final results = await Future.wait([
      _clientsRepo.getClients(),
      _ordersRepo.getOrders(),
    ]);

    results[0].fold(
          (failure) => emit(GetClientsFailure(failure.errMessage)),
          (data) {
        clients = data as List<UserEntity>;
        filteredClients = clients;
      },
    );

    results[1].fold(
          (failure) => emit(GetClientsFailure(failure.errMessage)),
          (data) => orders = data as List<OrderEntity>,
    );

    emit(GetClientsSuccess());
  }

  List<OrderEntity> getOrdersForUser(String userId) {
    return orders.where((order) => order.uId == userId).toList();
  }

  void searchClients(String value) {

    if (value.isEmpty) {
      filteredClients = clients;
      emit(GetClientsSuccess());
      return;
    }
    filteredClients = clients.where((user) {
      return user.userName
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
    if (filteredClients.isEmpty) {
      emit(SearchClientsEmpty());
    } else {
      emit(GetClientsSuccess());
    }
  }

}