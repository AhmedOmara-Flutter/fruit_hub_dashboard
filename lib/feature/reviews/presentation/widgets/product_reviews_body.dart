import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/view_model/get_reviews/get_reviews_cubit.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/widgets/product_review_card.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/widgets/review_card.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/widgets/skeletonizer_review_card.dart';

import '../../../../generated/assets.dart';
import '../../../../core/entities/product_entity.dart';
import '../../domain/entities/review_entity.dart';

class ProductReviewsViewBody extends StatefulWidget {
  final ProductEntity product;

  const ProductReviewsViewBody({super.key, required this.product});

  @override
  State<ProductReviewsViewBody> createState() => _ProductReviewsViewBodyState();
}

class _ProductReviewsViewBodyState extends State<ProductReviewsViewBody> {
  @override
  void initState() {
    print(widget.product.id);
    context.read<GetReviewsCubit>().getReviews(productId: widget.product.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ProductReviewCard(product: widget.product)),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.only(
                top: 10, right: 5
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('التعليقات', style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.black),)
            ],),
          )),
          BlocBuilder<GetReviewsCubit, GetReviewsState>(
            builder: (context, state) {

              if (state is ReviewError) {
                return SliverToBoxAdapter(child: Center(child: Text(state.errMessage)));
              }
              else if (state is ReviewSuccess) {

                final reviews = state.reviews;
                if (reviews.isEmpty) {
                  return SliverToBoxAdapter(child: Center(child: Column(
                    children: [
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.35),
                      Text('لا يوجد تعليقات حاليه'),
                    ],
                  )));
                }
                return SliverList.separated(
                  itemCount: reviews.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        ReviewCard(
                          review: ReviewEntity(
                            name: reviews[index].name,
                            image: reviews[index].image,
                            reviewDescription: reviews[index].reviewDescription,
                            rating: reviews[index].rating,
                            date: reviews[index].date,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return  SliverList.separated(
                itemCount: 5,
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      SkeletonizerReviewCard(
                        review: ReviewEntity(
                          name: 'reviews[index].name',
                          image: Assets.images.img.path,
                          reviewDescription: 'reviews[index].reviewDescription',
                          rating: 0.0,
                          date: 'reviews[index].date',
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

