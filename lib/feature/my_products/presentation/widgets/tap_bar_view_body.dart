import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/view_model/my_products_cubit.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/empty_products_widget.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_card.dart';

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
            itemBuilder: (context, index) => ProductCard(products[index]),
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemCount: products.length,
          );
        }

        if (state is GetFilteredProductsEmpty) {
          return EmptyProductsWidget();
        }

        return Center(child: CircularProgressIndicator(color: AppColor.mainColor,));
        // return ListView.separated(
        //     padding: EdgeInsets.only(left: 8, right: 8, top: 10),
        //     itemBuilder: (context, index) =>
        //         Skeletonizer(child: ProductCard(
        //             ProductEntity(name: '',
        //             code: '',
        //             price: 0,
        //             description: '',
        //             isFeatured: false,
        //             expirationMonth: 1,
        //             unitAmount: 1,
        //             numberOfCalories: 1,
        //             category: '',
        //               createdAt: '',
        //             )),),
        //           separatorBuilder: (context, index) => SizedBox(height: 5),
        //           itemCount: 5,
        //         );

        },

    );
  }
}







