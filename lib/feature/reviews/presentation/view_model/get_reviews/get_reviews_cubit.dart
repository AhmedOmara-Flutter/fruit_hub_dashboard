import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/review_entity.dart';
import '../../../domain/repos/review_repo.dart';

part 'get_reviews_state.dart';

class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit(this._reviewRepo) : super(GetReviewsInitial());
  final ReviewRepo _reviewRepo;


  Future<void> getReviews({required String productId}) async {
    emit(ReviewLoading());
    final reviews = await _reviewRepo.getReviews(productId: productId);
    return reviews.fold(
          (failure) {
        emit(ReviewError(failure.errMessage));
      },
          (reviews) {
        emit(ReviewSuccess(reviews));
      },
    );
  }

}
