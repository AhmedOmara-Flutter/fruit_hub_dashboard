import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/widgets/review_item.dart';

import '../view_model/get_products_with_review/get_product_with_reviews_cubit.dart';
import '../view_model/review_cubit.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    hintText: 'البحث..'
                ),
              ),
            ),
          ),
          BlocBuilder<GetProductWithReviewsCubit, GetProductWithReviewsState>(
            builder: (context, state) {
              if (state is GetProductsWithReviewsError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.errMessage),
                  ),
                );
              }
              if (state is GetProductsWithReviewsSuccess) {
                return SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.59,
                  )
                  ,
                  itemBuilder: (context, index) =>
                      GestureDetector(onTap: () {}, child: ReviewItem(
                        product: state.products[index],
                      )),
                  itemCount: state.products.length,
                );
              }
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

