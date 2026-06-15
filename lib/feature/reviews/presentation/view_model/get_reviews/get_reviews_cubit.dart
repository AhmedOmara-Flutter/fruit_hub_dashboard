import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/review_entity.dart';
import '../../../../../core/repos/reviews_repo/review_repo.dart';

part 'get_reviews_state.dart';

class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit(this._reviewRepo) : super(GetReviewsInitial());
  final ReviewRepo _reviewRepo;
  StreamSubscription? _reviewsSubscription;


  void getReviews({required String productId}) {
    emit(ReviewLoading());

    _reviewsSubscription?.cancel();
    _reviewsSubscription =  _reviewRepo.getReviews(productId: productId).listen((data){
      data.fold(
            (failure) {
          emit(ReviewError(failure.errMessage));
        },
            (reviews) {
          emit(ReviewSuccess(reviews));
        },
      );
    });

  }
  @override
  Future<void> close() {
    _reviewsSubscription?.cancel();
    return super.close();
  }

}
