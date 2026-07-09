import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/main_cubit.dart';
import 'drawer_item.dart';

class DrawerItemListView extends StatefulWidget {
  const DrawerItemListView({super.key});

  @override
  State<DrawerItemListView> createState() => _DrawerItemListViewState();
}

class _DrawerItemListViewState extends State<DrawerItemListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final cubit = context.read<MainCubit>();

        return SliverPadding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 15.w,
            top: 16.h,
            bottom: 16.h,
          ),
          sliver: SliverList.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                if (cubit.selectedIndex != index) {
                  cubit.changeIndex(index);

                  await Future.delayed(
                    const Duration(milliseconds: 190),
                  );

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              child: DrawerItem(
                drawerItemModel: cubit.drawerItems[index],
                isActive: cubit.selectedIndex == index,
              ),
            ),
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemCount: cubit.drawerItems.length,
          ),
        );
      },
    );
  }
}