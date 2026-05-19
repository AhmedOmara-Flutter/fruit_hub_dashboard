import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_back_button.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/widgets/display_orders_view_body.dart';

class DisplayOrdersView extends StatelessWidget {
  final List<OrderEntity> orders;
  const DisplayOrdersView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: AppColor.mainColor,
        title: Text('عرض الطلبات',style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Colors.white
        ),),
      ),
      body: DisplayOrdersViewBody(orders: orders,),
    );
  }
}
