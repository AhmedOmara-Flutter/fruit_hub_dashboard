import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/main_cubit.dart';
import 'drawer_item.dart';

class DrawerItemListView extends StatefulWidget {
  const DrawerItemListView({super.key});

  @override
  State<DrawerItemListView> createState() => _DrawerItemListViewState();
}

class _DrawerItemListViewState extends State<DrawerItemListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final cubit = context.read<MainCubit>();
        return  ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: cubit.drawerItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                onTap: () => cubit.changeIndex(index),
                child: DrawerItem(
                  drawerItemModel: cubit.drawerItems[index],
                  isActive: cubit.selectedIndex == index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}