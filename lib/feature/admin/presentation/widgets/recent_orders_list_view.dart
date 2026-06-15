
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/empty_widget.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/skeletonizer_order_item.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/view_model/orders_cubit.dart';

import '../../../../core/helper_function/get_date_formate.dart';
import '../../../../generated/assets.dart';
import '../view_model/admin_cubit.dart';
import 'order_item.dart';

class RecentOrdersListView extends StatelessWidget {
  const RecentOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final cubit = context.watch<OrdersCubit>();
        final recentOrders = cubit.recentOrders;

        final isLoading = state is GetOrdersLoadingState;

        if (isLoading) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) =>
             SkeletonizerOrderItem(
              image:Assets.images.img.path,
              amount: '1212',
              status: '',
              statusColor: Color(0xff214215),
              customerName: 'metgoekgmteit',
              time: '5454545',
              products: '554545545555455',
            ),
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey.shade200),
          );
       }

        if (recentOrders.isEmpty) {

          return   Container(margin: EdgeInsets.only(bottom: 10),
              child: Text('لا يوجد حاليا طلبات حديثه', style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,));
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentOrders.length,
          itemBuilder: (context, index) {
            final order = recentOrders[index];
            return OrderItem(
              image: order.userEntity!.image,
              amount: order.cartEntity.getTotalPrice(),
              status: '',
              statusColor: Colors.orange,
              customerName: order.userEntity!.userName,
              time: getTimeOnly(order.createdAt.toString()),
              products: order.cartEntity.cartItems
                  .map((item) =>
              '${item.product.name} × ${item.quantity}')
                  .join('\n'),
            );
          },
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey.shade200),
        );
      },
    );
  }
}