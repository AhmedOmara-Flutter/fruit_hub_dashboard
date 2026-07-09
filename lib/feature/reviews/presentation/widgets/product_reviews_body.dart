import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/assets.dart';
import '../../domain/entities/review_entity.dart';
import '../view_model/get_reviews/get_reviews_cubit.dart';
import 'product_review_card.dart';
import 'review_card.dart';
import 'skeletonizer_review_card.dart';

class ProductReviewsViewBody extends StatefulWidget {
  final ProductEntity product;

  const ProductReviewsViewBody({
    super.key,
    required this.product,
  });

  @override
  State<ProductReviewsViewBody> createState() =>
      _ProductReviewsViewBodyState();
}

class _ProductReviewsViewBodyState
    extends State<ProductReviewsViewBody> {
  @override
  void initState() {
    context.read<GetReviewsCubit>().getReviews(
      productId: widget.product.id!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 10.h,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductReviewCard(
              product: widget.product,
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                right: 5.w,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.reviews_rounded,
                    color: AppColor.mainColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'التعليقات',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(
                      color: AppColor.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          BlocBuilder<GetReviewsCubit, GetReviewsState>(
            builder: (context, state) {
              if (state is ReviewError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      state.errMessage,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                        color: AppColor.textPrimary,
                      ),
                    ),
                  ),
                );
              }

              if (state is ReviewSuccess) {
                final reviews = state.reviews;

                if (reviews.isEmpty) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .35,
                      child: Center(
                        child: Text(
                          'لا يوجد تعليقات حالياً',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return SliverList.separated(
                  itemCount: reviews.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: ReviewCard(
                        review: ReviewEntity(
                          name: reviews[index].name,
                          image: reviews[index].image,
                          reviewDescription:
                          reviews[index].reviewDescription,
                          rating: reviews[index].rating,
                          date: reviews[index].date,
                        ),
                      ),
                    );
                  },
                );
              }

              return SliverList.separated(
                itemCount: 5,
                separatorBuilder: (context, index) =>
                    SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: SkeletonizerReviewCard(
                      review: ReviewEntity(
                        name: 'Ahmed Omara',
                        image: Assets.images.img.path,
                        reviewDescription:
                        'هذا النص عبارة عن بيانات وهمية',
                        rating: 5,
                        date: 'اليوم',
                      ),
                    ),
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