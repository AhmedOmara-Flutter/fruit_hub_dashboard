import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/view_model/admin_cubit.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/product_item.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/skeletonizer_product_item.dart';

import '../../../../generated/assets.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {

        final cubit = context.watch<AdminCubit>();
        bool isLoading = cubit.state is  DashboardLoading;
        final topProducts = cubit.topProducts;

        if (isLoading)
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) =>SkeletonizerProductItem(
              productName: 'topProducts',
              orderCount:'00.00',
              image: Assets.images.img.path,
              medal: Assets.images.rise.path,

            ),
            separatorBuilder: (_, __) =>
                Divider(color: Colors.grey.shade200),
          );

        if (topProducts.isEmpty) {
          return Container(margin: EdgeInsets.only(bottom: 10),
              child: Text('لا يوجد حاليا اكثر منتجات مبيعا', style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,));
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: topProducts.take(3).length,
          itemBuilder: (context, index) => ProductItem(
            productName: topProducts[index].name,
            orderCount: topProducts[index].totalOrders.toString(),
            image: topProducts[index].image,
            medal: cubit.medals[index],
          ),
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey.shade200),
        );
      },
    );  }
}

class TopProduct {
  final String name;
  final String image;
  final int totalOrders;


  TopProduct({
    required this.name,
    required this.image,
    required this.totalOrders,
  });
}
