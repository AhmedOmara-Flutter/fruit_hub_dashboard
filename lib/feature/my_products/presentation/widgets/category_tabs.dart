import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/tap_bar_view_body.dart';

import '../../../../core/cubit/products_cubit/products_cubit.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs>
    with SingleTickerProviderStateMixin {

  final categories = ['فواكه', 'خضروات', 'مشروبات', 'مكسرات'];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: categories.length, vsync: this);

    context.read<ProductsCubit>()
        .getFilteredProducts(categories[0]);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<ProductsCubit>().getFilteredProducts(
          categories[_tabController.index],
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          Material(
            color: Colors.white,
            child: TabBar(
              isScrollable: false,
              indicatorColor: AppColor.mainColor,
              labelColor: AppColor.mainColor,
              labelStyle: Theme.of(context).textTheme.titleMedium!,
              tabs: categories.map((e) => Tab(text: e)).toList(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade200,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: categories.map((category) {
                  return TapBarViewBody(category);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
