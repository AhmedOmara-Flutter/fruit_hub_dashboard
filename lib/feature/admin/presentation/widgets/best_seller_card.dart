import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/product_item.dart';

import '../view_model/admin_cubit.dart';
import 'best_seller_list_view.dart';

class BestSellerCard extends StatelessWidget {
  const BestSellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all( 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'افضل المنتجات مبيعا',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.black),
              ),
              // const Spacer(),
              // Text(
              //   'عرض الكل',
              //   style: Theme.of(
              //     context,
              //   ).textTheme.titleSmall!.copyWith(color: Colors.green.shade600),
              // ),
            ],
          ),
          const SizedBox(height: 20),
          BestSellerListView(),
        ],
      ),
    );
  }
}

