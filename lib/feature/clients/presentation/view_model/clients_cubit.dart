import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clients_state.dart';

class ClientsCubit extends Cubit<ClientsState> {
  ClientsCubit() : super(ClientsInitial());
}
