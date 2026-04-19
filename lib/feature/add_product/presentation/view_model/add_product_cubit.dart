import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../../core/repos/add_product_repo/add_product_repo.dart';
import '../../../../core/repos/upload_image_repo/upload_image_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this._addRepo, this._uploadImageRepo)
      : super(AddProductInitial());

  final AddProductRepo _addRepo;
  final UploadImageRepo _uploadImageRepo;

  Future<void> addProduct(ProductEntity productEntity) async {
    emit(AddProductLoading());
    var result = await _uploadImageRepo.uploadImage(productEntity.imageFile);
    result.fold((failure) {
      emit(AddProductFailure(failure.errMessage));
    }, (url) async {
      print(url);
      productEntity.image = url;
      var result = await _addRepo.addProduct(productEntity);
      result.fold((failure) {
        emit(AddProductFailure(failure.errMessage));
      }, (success) {
        emit(AddProductSuccess());
      });
    });
  }


}




