import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';

import '../../../../core/cubit/orders_cubit/orders_cubit.dart';
import '../../../../core/entities/order_entity.dart';
import '../../../../core/helper_function/get_date_formate.dart';
import 'order_customer_info.dart';
import 'order_status_action.dart';
import 'order_status_badge.dart';
import 'order_summary_section.dart';
import 'order_user_image.dart';

class BuildOrderCard extends StatefulWidget {
  final OrderEntity order;
  final int index;
  final void Function()? userTap;

  const BuildOrderCard({
    super.key,
    required this.order,
    required this.index,
    this.userTap,
  });

  @override
  State<BuildOrderCard> createState() => _BuildOrderCardState();
}

class _BuildOrderCardState extends State<BuildOrderCard> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderUserImage(
                onTap: widget.userTap,
                imageUrl: widget.order.userEntity!.image,
              ),

              const SizedBox(width: 12),

              OrderCustomerInfo(
                customerName: widget.order.userEntity!.userName,
                orderId: '${widget.index + 1}'.padLeft(2, '0'),
                address: widget.order.getFullAddress(),
                products: widget.order.cartEntity.cartItems
                    .map((item) => '${item.product.name} × ${item.quantity}')
                    .join('\n'),
                price: widget.order.cartEntity.cartItems
                    .map((item) => '${item.unitPrice} ج.م ')
                    .join('\n'),
              ),
              const SizedBox(width: 8),
              OrderStatusBadge(
                color: widget.order.status.color,
                title: widget.order.status.ar,
              ),
            ],
          ),
          const SizedBox(height: 12),
          OrderSummarySection(
            time: '${getTimeOnly(widget.order.createdAt.toString())} ',
            totalPrice:
                '${widget.order.cartEntity.getTotalPrice().toStringAsFixed(2)} ج.م',
          ),
          const SizedBox(height: 14),
          if (widget.order.status == OrderStatus.pending) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                /// تأكيد الطلب
                Expanded(
                  child: OrderStatusButton(
                    title: 'تأكيد الطلب',
                    icon: Icons.check,
                    color: OrderStatus.confirmed.color,
                    onTap: () {
                      context.read<OrdersCubit>().updateOrderStatus(
                        orderId: widget.order.id ?? '',
                        status: OrderStatus.confirmed,
                      );
                    },
                  ),
                ),

                const SizedBox(width: 10),

                /// إلغاء الطلب
                Expanded(
                  child: OrderStatusButton(
                    title: 'إلغاء الطلب',
                    icon: Icons.cancel,
                    color: OrderStatus.cancelled.color,
                    onTap: () {
                      context.read<OrdersCubit>().updateOrderStatus(
                        orderId: widget.order.id ?? '',
                        status: OrderStatus.cancelled,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],

          /// confirmed → زر إنهاء
          if (widget.order.status == OrderStatus.confirmed) ...[
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: OrderStatusButton(
                    title: 'إنهاء الطلب',
                    icon: Icons.done_all,
                    color: OrderStatus.delivered.color,
                    onTap: () {
                      context.read<OrdersCubit>().updateOrderStatus(
                        orderId: widget.order.id ?? '',
                        status: OrderStatus.delivered,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],        ],
      ),
    );
  }
}
