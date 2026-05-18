import 'package:flutter/material.dart';
import 'drawer_item.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsGeometry.only(right: 10),
      leading: Icon(drawerItemModel.inactiveIcon, color: Colors.grey,),
      title: Text(
        drawerItemModel.title,
        style: Theme.of(
          context,
        ).textTheme.labelMedium!.copyWith(color: Colors.grey),
      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff1B5E37),
      ),
      child: ListTile(
        contentPadding: EdgeInsetsGeometry.only(right: 10),
        leading: Icon(drawerItemModel.activeIcon, color: Colors.white,size: 30,),
        title: Text(
          drawerItemModel.title,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: Colors.white,fontSize:18 ),
        ),
      ),
    );
  }
}
