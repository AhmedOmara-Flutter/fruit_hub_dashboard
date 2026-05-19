import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/domain/repos/my_product_repo.dart';
import 'package:meta/meta.dart';

part 'my_products_state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit(this._myProductRepo) : super(MyProductsInitial());
  final MyProductRepo _myProductRepo;
  List<ProductEntity> filteredProducts = [];

  Future<void> getFilteredProducts(String category) async {
    emit(GetFilteredProductsLoading());
    final result = await _myProductRepo.getFilteredProducts(category);
    result.fold(
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
  }
}
