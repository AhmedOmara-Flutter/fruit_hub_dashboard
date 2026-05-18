import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';
import 'drawer_item_list_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomDrawerHeader()),
          DrawerItemListView(),
        ],
      ),
    );
  }
}
