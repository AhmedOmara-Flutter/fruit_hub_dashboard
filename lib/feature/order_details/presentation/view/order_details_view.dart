import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/order_details/presentation/widgets/order_details_view_body.dart';
import '../../../../core/entities/order_entity.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_back_button.dart';

class OrderDetailsView extends StatelessWidget {
  final OrderEntity order;
  const OrderDetailsView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: AppColor.background,
        title: Text('تفاصيل الطلب',style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Colors.white
        ),),
      ),
      body: OrderDetailsViewBody(
        order: order,
      ),
    );
  }
}
