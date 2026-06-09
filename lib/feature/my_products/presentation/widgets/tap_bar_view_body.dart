import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/view_model/my_products_cubit.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/empty_products_widget.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_card.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/skeletonizer_product_card.dart';

import '../../../../core/helper_function/get_dummy_products.dart';
import '../../../offers/domain/entities/offer_entity.dart';
import '../../../offers/presentation/view_model/offer_cubit.dart';

class TapBarViewBody extends StatefulWidget {
  final String category;

  const TapBarViewBody(this.category, {super.key});

  @override
  State<TapBarViewBody> createState() => _TapBarViewBodyState();
}

class _TapBarViewBodyState extends State<TapBarViewBody> {

  @override
  void initState() {
    context.read<MyProductsCubit>().getFilteredProducts(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProductsCubit, MyProductsState>(
      builder: (context, state) {
        final products = context
            .read<MyProductsCubit>()
            .filteredProducts;
        final offers = context
            .watch<OfferCubit>()
            .offers;
        if (state is GetFilteredProductsLoading) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10),
            itemBuilder: (context, index) =>
                SkeletonizerProductCard(getDummyProduct),
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemCount: getDummyProducts.length,
          );
        }
        if (state is GetFilteredProductsSuccess) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10),
            itemBuilder: (context, index) {
              final product = products[index];

              final offer = offers.cast<OfferEntity?>().firstWhere(
                    (e) => e?.productId == product.id,
                orElse: () => null,
              );
              return ProductCard(product: products[index], offer: offer,);
            },
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemCount: products.length,
          );
        }
        if (state is GetFilteredProductsEmpty) {
          return EmptyProductsWidget();
        }
        if (state is GetFilteredProductsError) {
          return Center(child: Text(state.errMessage));
        }

        return SizedBox.shrink();
      },
    );
  }
}







