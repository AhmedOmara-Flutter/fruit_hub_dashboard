import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';

import '../../../../generated/assets.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.h),
      color: AppColor.card,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColor.border,
          backgroundImage: AssetImage(
            Assets.images.img.path,
          ),
        ),
        title: Text(
          'صباح الخير!..',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColor.textPrimary,
          ),
        ),
        subtitle: Text(
          'أحمد عماره',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColor.textSecondary,
          ),
        ),
      ),
    );
  }
}