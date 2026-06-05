import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../clients/presentation/widgets/statistics_card.dart';

class StatisticsSectionLoading extends StatelessWidget {
  const StatisticsSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildCard(Colors.green)),
              const SizedBox(width: 10),
              Expanded(child: _buildCard(Colors.orange)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildCard(Colors.purple)),
              const SizedBox(width: 10),
              Expanded(child: _buildCard(Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Color color) {
    return StatisticsCard(
      model: StatisticsCardModel(
        color: color,
        icon: Icons.circle,
        title: 'عنوان الإحصائية',
        subTitleNumber: '12,345',
        subTitleText: 'وصف الإحصائية',
      ),
    );
  }
}