import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/widgets/empty_widget.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/widgets/build_order_card.dart';
import '../../../../core/cubit/orders_cubit/orders_cubit.dart';
import '../../../admin/presentation/view_model/admin_cubit.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  String selectedStatus = 'الكل';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                _buildTab('الكل'),
                _buildTab('انتظار'),
                _buildTab('مؤكد'),
                _buildTab('منتهي'),
              ],
            ),
          ),
        ),),
        BlocBuilder<AdminCubit, AdminState>(
          builder: (context, state) {
            final cubit = context.watch<OrdersCubit>();
            final orders = cubit.orders;
            if (orders.isEmpty) {
            SliverToBoxAdapter(
              child:Text('worngoentgot'),
            );
            }


            return SliverList.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return BuildOrderCard(
                    index: index,
                    order: orders[index]);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildTab(String title) {
    final isSelected = selectedStatus == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatus = title;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(vertical: 12,),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.mainColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}