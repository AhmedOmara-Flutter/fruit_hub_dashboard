import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/feature/reviews/domain/repos/review_repo.dart';
import 'package:meta/meta.dart';

import '../../../../add_product/domain/entities/product_entity.dart';

part 'get_product_with_reviews_state.dart';

class GetProductWithReviewsCubit extends Cubit<GetProductWithReviewsState> {
  GetProductWithReviewsCubit(this._reviewRepo) : super(GetProductWithReviewsInitial());
  final ReviewRepo _reviewRepo;


  Future<void> getProductsWithReviews() async {
    emit(GetProductsWithReviewsLoading());
    final products = await _reviewRepo.getProductsWithReviews();

    return products.fold(
          (failure) {
        emit(GetProductsWithReviewsError(failure.errMessage));
      },
          (products) {
        print('products is ${products}');
        emit(GetProductsWithReviewsSuccess(products));
      },
    );
  }

}
