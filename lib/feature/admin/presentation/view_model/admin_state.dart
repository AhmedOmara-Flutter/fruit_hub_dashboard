part of 'admin_cubit.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}
final class DashboardLoading extends AdminState {}

final class GetProductsLoading extends AdminState {}

final class GetProductsError extends AdminState {
  final String errMessage;

  GetProductsError(this.errMessage);
}

final class GetProductsSuccess extends AdminState {}

final class GetOrdersLoading extends AdminState {}

final class GetOrdersError extends AdminState {
  final String errMessage;

  GetOrdersError(this.errMessage);
}

final class GetOrdersSuccess extends AdminState {
  final List<OrderEntity> orders;

  GetOrdersSuccess(this.orders);
}
