import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/get_date_formate.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/order_item.dart';

import '../view_model/admin_cubit.dart';

class RecentOrdersListView extends StatelessWidget {
  const RecentOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        final recentOrders = context.read<AdminCubit>().recentOrders;

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final order = recentOrders[index];

            if (order.cartEntity.cartItems.isEmpty) {
              return const SizedBox();
            }

            return OrderItem(
              image: order.userEntity!.image,
              amount: '${recentOrders[index].allOrdersPrice()}',
              status: '',
              statusColor: Colors.orange,
              customerName: order.userEntity!.userName,
              time: getTimeOnly(order.createdAt.toString()),
              products: order.cartEntity.cartItems
                  .map((item) => '${item.product.name} × ${item.quantity}')
                  .join('\n'),
            );
          },
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey.shade200),
          itemCount: recentOrders.length,
        );
      },
    );
  }
}
