import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: Colors.grey.shade200,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 25,
          backgroundImage: AssetImage(Assets.images.img.path),
        ),
        title: Text(
          'صباح الخير!..',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        subtitle: Text(
          ' احمد عماره',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.grey
          ),      ),
      ),
    );
  }
}
