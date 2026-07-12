import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';
import 'package:fruit_hub_dashboard/core/helper_function/make_full_name.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/route_manager.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';
import 'package:fruit_hub_dashboard/generated/assets.dart';

import 'customer_info_item.dart';

class CustomerCard extends StatelessWidget {
  final UserEntity user;
  final List<OrderEntity> orders;

  const CustomerCard({
    super.key,
    required this.user,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    final totalAmount =
        orders.fold(
          0.0,
              (sum, order) => sum + order.cartEntity.getTotalPrice(),
        ) +
            orders.fold(
              0.0,
                  (sum, order) => sum + order.selectedLocationEntity!.cost,
            );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundColor: AppColor.mainColor.withOpacity(.15),
                backgroundImage: AssetImage(
                  Assets.images.customer.path,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      makeFullName(user.userName),
                      style: StyleManager.font13Weight600.copyWith(
                        color: AppColor.white,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      user.email,
                      style: StyleManager.font12Weight500.copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      user.phone,
                      style: StyleManager.font12Weight500.copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          Row(
            children: [
              Expanded(
                child: CustomerInfoItem(
                  icon: Icons.shopping_bag_outlined,
                  title: '${orders.length}',
                  subtitle: 'طلبات',
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: CustomerInfoItem(
                  icon: Icons.payments_outlined,
                  title: '${totalAmount.toStringAsFixed(0)} ج.م',
                  subtitle: 'إجمالي الشراء',
                ),
              ),
            ],
          ),

          if (orders.isNotEmpty) ...[
            SizedBox(height: 14.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteManager.displayOrders,
                    arguments: orders,
                  );
                },
                child: Text(
                  'عرض الطلبات',
                  style: StyleManager.font13Weight600.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}