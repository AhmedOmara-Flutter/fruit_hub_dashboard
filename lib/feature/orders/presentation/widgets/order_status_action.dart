import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';

class OrderStatusButton extends StatelessWidget {
  const OrderStatusButton({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isSelected
          ? ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      )
          : OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(title),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.mainColor,
          side: BorderSide(color: AppColor.mainColor,width: .4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}