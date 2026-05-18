import 'package:flutter/material.dart';

class CustomerInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CustomerInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xff166534), size: 26),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black,
              ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
