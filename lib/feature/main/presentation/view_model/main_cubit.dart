import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/add_product_view.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/view/clients_view.dart';
import 'package:fruit_hub_dashboard/feature/main/presentation/widgets/drawer_item.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/view/my_products_view.dart';

import '../../../admin/presentation/view/admin_view.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  int selectedIndex = 0;

  final List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
      title: 'الصفحه الرئيسيه',
      inactiveIcon: Icons.home_outlined,
      activeIcon: Icons.home_filled,
    ),
    DrawerItemModel(
      title: 'المنتجات',
      inactiveIcon: Icons.category_outlined,
      activeIcon: Icons.category_rounded,
    ),
    DrawerItemModel(
      title: 'اضافه منتج',
      inactiveIcon: Icons.add,
      activeIcon: Icons.add,
    ),
    DrawerItemModel(
      title: 'الجرد',
      inactiveIcon: Icons.inventory_2_outlined,
      activeIcon: Icons.inventory,
    ),
    DrawerItemModel(
      title: 'آراء العملاء',
      inactiveIcon: Icons.star_border_rounded,
      activeIcon: Icons.star,
    ),
    DrawerItemModel(
      title: 'الطلبات',
      inactiveIcon: Icons.local_shipping_outlined,
      activeIcon: Icons.local_shipping,
    ),
    DrawerItemModel(
      title: 'العملاء',
      inactiveIcon: Icons.people_alt_outlined,
      activeIcon: Icons.people,
    ),
    DrawerItemModel(
      title: 'العروض',
      inactiveIcon: Icons.local_offer_outlined,
      activeIcon: Icons.local_offer,
    ),
    DrawerItemModel(
      title: 'الاعدادات',
      inactiveIcon: Icons.settings_outlined,
      activeIcon: Icons.settings,
    ),
  ];

  final List<Widget> screens = [
    AdminView(),
    MyProductsView(),
    AddProductView(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    ClientsView(),
    SizedBox(),
    SizedBox(),
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(MainChangeIndex());
  }
}
