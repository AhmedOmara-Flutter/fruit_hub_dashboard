import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import 'drawer_item.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(right: 10.w),
      leading: Icon(
        drawerItemModel.inactiveIcon,
        color: AppColor.textSecondary,
        size: 24.sp,
      ),
      title: Text(
        drawerItemModel.title,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: AppColor.textSecondary,
        ),
      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.mainColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(right: 10.w),
        leading: Icon(
          drawerItemModel.activeIcon,
          color: AppColor.white,
          size: 30.sp,
        ),
        title: Text(
          drawerItemModel.title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColor.white,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}