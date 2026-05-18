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

        return SliverPadding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 15,
            top: 16,
            bottom: 16,
          ),
          sliver: SliverList.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async{
                if (cubit.selectedIndex != index) {
                  cubit.changeIndex(index);
                  await Future.delayed(
                    const Duration(milliseconds: 190),
                  );
                  Navigator.pop(context);
                }
              },
              child: DrawerItem(
                drawerItemModel: cubit.drawerItems[index],
                isActive: cubit.selectedIndex == index,
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: cubit.drawerItems.length,
          ),
        );
      },
    );
  }
}
