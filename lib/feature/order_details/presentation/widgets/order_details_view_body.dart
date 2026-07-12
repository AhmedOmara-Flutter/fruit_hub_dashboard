import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/feature/order_details/presentation/widgets/order_note_card_section.dart';
import 'package:fruit_hub_dashboard/feature/order_details/presentation/widgets/order_summary_card_section.dart';
import 'package:fruit_hub_dashboard/feature/order_details/presentation/widgets/payment_card_section.dart';
import 'package:fruit_hub_dashboard/feature/order_details/presentation/widgets/products_section.dart';
import 'customer_info_section.dart';
import 'delivery_address_section.dart';
import 'order_header_section.dart';

class OrderDetailsViewBody extends StatelessWidget {
  final OrderEntity order;

  const OrderDetailsViewBody({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
      child: Column(
        spacing: 10,
        children: [
          OrderHeaderSection(order: order, ),
          CustomerInfoSection(order: order),
          DeliveryAddressSection(order: order),
          ProductsSection(order: order),
          OrderNoteCardSection(note: order.orderNote),
          PaymentCardSection(
            paymentMethod: order.isCashOnDelivery == true ? 'Cash' : 'Online',
            paymentImage: order.paymentImage,
          ),
          OrderSummaryCardSection(
            subTotal: order.cartEntity.getTotalPrice(),
            deliveryCost: order.selectedLocationEntity!.cost,
          ),
        ],
      ),
    );
  }
}
