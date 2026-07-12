import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/widgets/empty_widget.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/widgets/build_order_card.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/widgets/skeletonizer_build_order_card.dart';

import '../../../../core/cubit/orders_cubit/orders_cubit.dart';
import '../../../../core/enums/order_enum.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  String selectedStatus = 'انتظار';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 10.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColor.card,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: AppColor.border,
                  ),
                ),
                child: Row(
                  children: [
                    _buildTab('انتظار'),
                    _buildTab('مؤكد'),
                    _buildTab('منتهي'),
                    _buildTab('ملغي'),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              final cubit = context.watch<OrdersCubit>();
              final orders = cubit.filteredOrders;
              if (state is GetOrdersLoadingState) {
                return SliverList.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const SkeletonizerBuildOrderCard();
                  },
                );
              }

              if (state is GetOrdersErrorState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.errMessage),
                  ),
                );
              }

              if (orders.isEmpty) {
                return const SliverToBoxAdapter(
                  child: EmptyWidget(),
                );
              }

              return SliverList.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return BuildOrderCard(
                    totalOrders: orders.length,
                    index: index,
                    order: orders[index],
                  );
                },
              );
            },
          )      ],
      ),
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

          final cubit = context.read<OrdersCubit>();

          switch (title) {
            case 'انتظار':
              cubit.filterByStatus(OrderStatus.pending);
              break;
            case 'مؤكد':
              cubit.filterByStatus(OrderStatus.confirmed);
              break;
            case 'منتهي':
              cubit.filterByStatus(OrderStatus.delivered);
              break;
            case 'ملغي':
              cubit.filterByStatus(OrderStatus.cancelled);
              break;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColor.mainColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColor.textPrimary
                    : AppColor.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}