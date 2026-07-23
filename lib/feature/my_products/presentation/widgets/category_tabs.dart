import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final categories = [
    'بيتزا',
    'كريب لحوم',
    'كريب دجاج',
    'كريب ميكس',
    'سندوتشات سوري',
    'مكرونات',
    'مشويات',
    'حواوشي ايطالي',
    'برجر',
    'فطائر',
    'اضافات',
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: categories.length,
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsCubit>().filterByCategory(categories[0]);
    });

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      context.read<ProductsCubit>().filterByCategory(
        categories[_tabController.index],
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Container(
            height: 52.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: TabBar(
              splashFactory: NoSplash.splashFactory,
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: AppColor.textSecondary,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
              dividerColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              splashBorderRadius: BorderRadius.circular(25.r),
              tabs: categories.map((e) {
                return Tab(

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    child: Text(e),
                  ),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: Container(
              color: AppColor.background,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
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