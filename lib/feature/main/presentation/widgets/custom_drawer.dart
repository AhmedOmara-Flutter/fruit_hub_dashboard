import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import 'custom_drawer_header.dart';
import 'drawer_item_list_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: CustomScrollView(
        slivers: const [
          SliverToBoxAdapter(
            child: CustomDrawerHeader(),
          ),
          DrawerItemListView(),
        ],
      ),
    );
  }
}