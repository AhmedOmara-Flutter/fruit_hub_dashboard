part of 'admin_cubit.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class GetProductsLoadingState extends AdminState {}
final class GetProductsSuccessState extends AdminState {}

final class GetProductsErrorState extends AdminState {
  final String errMessage;

  GetProductsErrorState(this.errMessage);
}
