import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/widgets/statistics_card.dart';

import 'customer_card.dart';
import 'customer_statistics_section.dart';

class ClientsViewBody extends StatelessWidget {
  const ClientsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CustomerStatisticsSection(),
                    SizedBox(height: 10),
                    CustomTextField(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              CustomerCard(),
              CustomerCard(),
              CustomerCard(),
              CustomerCard(),
              CustomerCard(),
              CustomerCard(),
            ],
          ),
        ),
      ],
    );
  }
}

