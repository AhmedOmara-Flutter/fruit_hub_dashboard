import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Text(title, style: StyleManager.font13Weight600),
        const Spacer(),
        Text(
          value,
          style: StyleManager.font16Weight600,
        ),
      ],
    );
  }
}