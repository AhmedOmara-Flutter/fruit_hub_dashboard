import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/empty_products_widget.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_card.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/skeletonizer_product_card.dart';

import '../../../../core/cubit/offers_cubit/offers_cubit.dart';
import '../../../../core/cubit/products_cubit/products_cubit.dart';
import '../../../../core/entities/offer_entity.dart';
import '../../../../core/helper_function/get_dummy_products.dart';

class TapBarViewBody extends StatelessWidget {
  final String category;

  const TapBarViewBody(
      this.category, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        debugPrint(state.runtimeType.toString());

        final cubit = context.read<ProductsCubit>();

        final products = cubit.allProducts
            .where((p) => p.category == category)
            .toList();

        final offers = context.watch<OffersCubit>().offers;

        if (state is GetFilteredProductsLoading) {
          return ListView.separated(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 10.h,
            ),
            itemBuilder: (context, index) =>
                SkeletonizerProductCard(getDummyProduct),
            separatorBuilder: (context, index) =>
                SizedBox(height: 5.h),
            itemCount: getDummyProducts.length,
          );
        }

        if (products.isEmpty) {
          return const EmptyProductsWidget();
        }

        if (state is GetFilteredProductsError) {
          return Center(
            child: Text(state.errMessage),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            top: 10.h,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            final offer = offers.cast<OfferEntity?>().firstWhere(
                  (e) => e?.productId == product.id,
              orElse: () => null,
            );

            return ProductCard(
              product: product,
              offer: offer,
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: 5.h),
          itemCount: products.length,
        );
      },
    );
  }
}