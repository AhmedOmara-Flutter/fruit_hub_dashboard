import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/helper_function/get_date_formate.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/enums/order_enum.dart';
import '../../../orders/presentation/widgets/order_status_badge.dart';
import 'display_order_card.dart';

class DisplayOrdersViewBody extends StatelessWidget {
  final List<OrderEntity> orders;

  const DisplayOrdersViewBody({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10.w),
      itemCount: orders.length,
      separatorBuilder: (_, __) => SizedBox(height: 14.h),
      itemBuilder: (context, index) {
        return DisplayOrderCard(
          order: orders[index],
          orderNumber: orders.length - index,
        );
      },
    );
  }
}
