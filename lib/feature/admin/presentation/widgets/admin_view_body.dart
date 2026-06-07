import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/recent_order_card.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/skeletonizer_statistics_section.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/statistics_section.dart';

import '../view_model/admin_cubit.dart';
import 'best_seller_card.dart';

class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            BlocBuilder<AdminCubit, AdminState>(
              builder: (context, state) {
                final cubit = context.watch<AdminCubit>();

                if (cubit.products.isNotEmpty) {
                  return SliverToBoxAdapter(
                    child: StatisticsSection(),
                  );
                }
                else if (state is GetProductsError) {
                  return SliverToBoxAdapter(
                    child: Text(state.errMessage),
                  );
                }

                return SliverToBoxAdapter(
                  child: SkeletonizerStatisticsSection(),
                );
              },
            ),
            SliverToBoxAdapter(
              child: RecentOrdersCard(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(child: BestSellerCard()),
          ],
        )
    );
  }
}
