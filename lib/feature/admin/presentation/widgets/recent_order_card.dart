import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/recent_orders_list_view.dart';
import 'package:fruit_hub_dashboard/feature/main/presentation/view_model/main_cubit.dart';
import '../../../../core/cubit/orders_cubit/orders_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentOrdersCard extends StatelessWidget {
  const RecentOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_long_rounded,
                color: AppColor.mainColor,
                size: 22.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'الطلبات الحديثه',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          const RecentOrdersListView(),

          if (context.watch<OrdersCubit>().allOrders.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.read<MainCubit>().changeIndex(4);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 15.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.border,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.grid_view_rounded,
                          size: 16.sp,
                          color: AppColor.textPrimary,
                        ),
                        Text(
                          'عرض جميع الطلبات',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            color: AppColor.textPrimary,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18.sp,
                          color: AppColor.textPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
