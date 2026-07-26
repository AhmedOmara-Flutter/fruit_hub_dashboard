import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/style_manager.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const InfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColor.border.withOpacity(.7),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: StyleManager.font12Weight500(context).copyWith(
                color: AppColor.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(width: 12),

          Expanded(
            flex: 4,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}