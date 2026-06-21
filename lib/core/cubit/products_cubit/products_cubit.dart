import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:meta/meta.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<MyProductsState> {
  ProductsCubit(this._productRepo)
    : super(MyProductsInitial());
  final ProductRepo _productRepo;
  StreamSubscription? _productsSubscription;
  List<ProductEntity> filteredProducts = [];

  void getProducts() async {
    _productsSubscription?.cancel();

    emit(GetFilteredProductsLoading());

    _productsSubscription =  _productRepo.getProducts().listen((data){
      data.fold(
            (failure) => emit(GetFilteredProductsError(failure.errMessage)),
            (products) {
          filteredProducts = products;

          if (filteredProducts.isEmpty) {
            emit(GetFilteredProductsEmpty());
          } else {
            emit(GetFilteredProductsSuccess());
          }
        },
      );
    });
  }

  Future<void> getFilteredProducts(String category) async {
    _productsSubscription?.cancel();
    emit(GetFilteredProductsLoading());
    _productsSubscription= _productRepo.getFilteredProducts(category).listen((data){
      data.fold(
            (failure) => emit(GetFilteredProductsError(failure.errMessage)),
            (data) {
          filteredProducts = data;
          if (filteredProducts.isEmpty) {
            emit(GetFilteredProductsEmpty());
          } else {
            emit(GetFilteredProductsSuccess());
          }
        },
      );
    });

  }

  Future<void> deleteProduct(String productId) async {
    emit(DeleteProductLoading());
    try {
      await _productRepo.deleteProduct(productId);
      filteredProducts.removeWhere((p) => p.id == productId);

      emit(DeleteProductSuccess());
    } catch (e) {
      emit(DeleteProductError(e.toString()));
    }
  }

@override
  Future<void> close() {
    _productsSubscription?.cancel();
    return super.close();
  }
}
