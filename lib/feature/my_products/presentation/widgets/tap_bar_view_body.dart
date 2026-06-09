import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/view_model/my_products_cubit.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/empty_products_widget.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_card.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/skeletonizer_product_card.dart';

import '../../../../core/helper_function/get_dummy_products.dart';

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
        final cubit = context.read<MyProductsCubit>();
        if (state is GetFilteredProductsError) {
          return Center(child: Text(state.errMessage));
        }
        if (state is GetFilteredProductsSuccess) {
          final products = cubit.filteredProducts;

          return ListView.separated(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10),
            itemBuilder: (context, index) => ProductCard(product: products[index]),
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemCount: products.length,
          );
        }
        if (state is GetFilteredProductsEmpty) {
          return EmptyProductsWidget();
        }
        return ListView.separated(
          padding: EdgeInsets.only(left: 8, right: 8, top: 10),
          itemBuilder: (context, index) =>
              SkeletonizerProductCard(getDummyProduct),
          separatorBuilder: (context, index) => SizedBox(height: 5),
          itemCount: getDummyProducts.length,
        );
      },
    );
  }
}







