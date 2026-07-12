import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/core/helper_function/get_date_formate.dart';
import 'package:fruit_hub_dashboard/core/helper_function/make_full_name.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/route_manager.dart';
import '../../../../core/cubit/orders_cubit/orders_cubit.dart';
import '../../../../core/entities/order_entity.dart';
import 'order_customer_info.dart';
import 'order_status_action.dart';
import 'order_status_badge.dart';
import 'order_summary_section.dart';
import 'order_user_image.dart';

class BuildOrderCard extends StatefulWidget {
  final OrderEntity order;
  final int index;
  final int totalOrders;

  const BuildOrderCard({
    super.key,
    required this.order,
    required this.index,
    required this.totalOrders,
  });

  @override
  State<BuildOrderCard> createState() => _BuildOrderCardState();
}

class _BuildOrderCardState extends State<BuildOrderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteManager.orderDetails,
            arguments:widget.order);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColor.card,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColor.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderUserImage(order: widget.order),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: OrderCustomerInfo(
                        customerName: makeFullName(
                          widget.order.userEntity!.userName,
                        ),
                        phone: widget.order.userEntity!.phone,
                        orderId: '${widget.totalOrders - widget.index}'.padLeft(
                          2,
                          '0',
                        ),
                        address: widget.order.getFullAddress(),
                        location: widget.order.selectedLocationEntity!.title,
                        products: widget.order.cartEntity.cartItems
                            .map(
                              (item) => '${item.product.name} × ${item
                              .quantity}',
                        )
                            .join('\n'),
                        price: widget.order.cartEntity.cartItems
                            .map((item) => '${item.unitPrice} ج.م')
                            .join('\n'),
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
                SizedBox(height: 12.h),
                OrderSummarySection(
                  time: getTimeOnly(widget.order.createdAt.toString()),
                  deliveryCost: widget.order.selectedLocationEntity!.cost,
                  totalPrice: widget.order.cartEntity.getTotalPrice(),
                ),
                if (widget.order.status == OrderStatus.pending) ...[
                  SizedBox(height: 14.h),
                  Row(
                    children: [
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

                      SizedBox(width: 10.w),

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
                if (widget.order.status == OrderStatus.confirmed) ...[
                  SizedBox(height: 14.h),
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
                ],
              ],
            ),
            OrderStatusBadge(
              color: widget.order.status.color,
              title: widget.order.status.ar,
            ),
          ],
        ),
      ),
    );
  }
}
