import 'package:flutter/material.dart';

class OrderStatusButton extends StatelessWidget {
  const OrderStatusButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18, color: color),
      label: Text(
        title,
        style: TextStyle(color: color),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        side: BorderSide(
          color: color,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}