import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/assets.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: AppColor.card,
        border: Border(
          bottom: BorderSide(color: AppColor.border),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColor.border,
            backgroundImage: AssetImage(
              Assets.images.img1.path,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'صباح الخير 👋',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColor.textSecondary,
                    fontSize:
                    responsiveFontSize(context, fontSize: 10),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'مصطفى إبراهيم',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColor.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize:
                    responsiveFontSize(context, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}