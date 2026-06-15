import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final StatisticsCardModel model;

  const StatisticsCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:model.onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: model.color,
                  radius: 20,
                  child: Icon(model.icon, color: Colors.white),
                ),
                SizedBox(width: 5),
                Text(
                  model.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              '${model.subTitleNumber}',
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              '${model.subTitleText}',
              style: Theme.of(context).textTheme.titleSmall!,
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsCardModel {
  final Color color;
  final IconData icon;
  final String title;
  final String subTitleNumber;
  final String subTitleText;
  final void Function()? onTap;

  StatisticsCardModel({
    required this.color,
    required this.icon,
    required this.title,
    required this.subTitleNumber,
    required this.subTitleText,
    this.onTap,
  });
}
