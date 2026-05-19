part of 'my_products_cubit.dart';

@immutable
sealed class MyProductsState {}

final class MyProductsInitial extends MyProductsState {}
final class GetFilteredProductsLoading extends MyProductsState {}
final class GetFilteredProductsError extends MyProductsState {
  final String errMessage;
  GetFilteredProductsError(this.errMessage);
}
final class GetFilteredProductsSuccess extends MyProductsState {}
final class GetFilteredProductsEmpty extends MyProductsState {}
