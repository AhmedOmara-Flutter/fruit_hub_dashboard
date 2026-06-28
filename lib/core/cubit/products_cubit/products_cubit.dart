import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productRepo) : super(ProductsInitial());
  final ProductRepo _productRepo;
  StreamSubscription? _productsSubscription;
  List<ProductEntity> filteredProducts = [];
  List<ProductEntity> allProducts = [];

  void getProducts() {
    _productsSubscription?.cancel();

    emit(GetProductsLoadingState());
    _productsSubscription = _productRepo.getProducts().listen((data) {
      data.fold(
        (failure) {
          emit(GetProductsErrorState(errMessage: failure.errMessage));
        },
        (data) {
          allProducts = data;
          filteredProducts = data;

          emit(GetProductsSuccessState(products: data));
        },
      );
    });
  }

  void filterByCategory(String category) {
    final result = allProducts.where((product) {
      return product.category == category;
    }).toList();

    filteredProducts = result;

    if (result.isEmpty) {
      emit(GetFilteredProductsEmpty());
    } else {
      emit(GetFilteredProductsSuccess(filterProducts: result));
    }
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

  Future<void> deleteCartCollectionForUser() async {
    emit(DeleteCartLoadingState());

    try {
      await _productRepo.deleteCollection('carts');

      emit(DeleteCartSuccessState());
    } catch (e) {
      emit(DeleteCartErrorState(e.toString()));
    }
  }


  @override
  Future<void> close() {
    _productsSubscription?.cancel();
    return super.close();
  }
}
