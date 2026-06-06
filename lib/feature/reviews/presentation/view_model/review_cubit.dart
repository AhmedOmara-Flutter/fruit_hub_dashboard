// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../../add_product/domain/entities/product_entity.dart';
// import '../../domain/entities/review_entity.dart';
// import '../../domain/repos/review_repo.dart';
//
// part 'review_state.dart';
//
// class ReviewCubit extends Cubit<ReviewState> {
//   ReviewCubit(this._reviewRepo) : super(ReviewInitial());
//   final ReviewRepo _reviewRepo;
//
//   Future<void> getReviews({required String productId}) async {
//     emit(ReviewLoading());
//     final reviews = await _reviewRepo.getReviews(productId: productId);
//     return reviews.fold(
//       (failure) {
//         emit(ReviewError(failure.errMessage));
//       },
//       (reviews) {
//         emit(ReviewSuccess(reviews));
//       },
//     );
//   }
//   Future<void> getProductsWithReviews() async {
//     emit(GetProductsWithReviewsLoading());
//     final products = await _reviewRepo.getProductsWithReviews();
//
//     return products.fold(
//       (failure) {
//         emit(GetProductsWithReviewsError(failure.errMessage));
//       },
//       (products) {
//         print('products is ${products}');
//         emit(GetProductsWithReviewsSuccess(products));
//       },
//     );
//   }
// }
