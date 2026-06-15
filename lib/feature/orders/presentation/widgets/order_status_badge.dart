import 'package:flutter/material.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Colors.orange.shade800,
        ),
      ),
    );
  }
}