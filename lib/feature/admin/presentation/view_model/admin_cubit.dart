import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/order_entity.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/models/top_product_model.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../generated/assets.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this._productRepo,) : super(AdminInitial());
  final ProductRepo _productRepo;
  List<ProductEntity> products = [];
  StreamSubscription? _productsSubscription;


  void getProducts() async {
    emit(GetProductsLoadingState());

    _productsSubscription?.cancel();
    _productsSubscription = _productRepo.getProducts().listen((data) {
      data.fold(
            (f) {
          print(f.errMessage);
          emit(GetProductsErrorState(f.errMessage));
          return [];
        },
            (data) {
          print('PRODUCTS LOADED => ${data.length}');

          products = data;
          emit(GetProductsSuccessState());

          return products;
        },
      );
    });

  }


  @override
  Future<void> close() {
    _productsSubscription?.cancel();
    return super.close();
  }
}