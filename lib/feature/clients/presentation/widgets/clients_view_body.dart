import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/widgets/custom_text_field.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/empty_widget.dart';
import '../view_model/clients_cubit.dart';
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
                color: AppColor.background,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CustomerStatisticsSection(),
                    SizedBox(height: 10),
                    CustomTextField(
                      onChanged: (value) {
                        context.read<ClientsCubit>().searchClients(value);
                      },
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<ClientsCubit, ClientsState>(
          builder: (context, state) {
            if (state is SearchClientsEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: Text('لا يوجد عميل بهذا الاسم'),
                ),
              );
            }

            if (state is GetClientsSuccess) {

              final clients = context
                  .read<ClientsCubit>()
                  .filteredClients;

              if (clients.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    children: [
                      SizedBox(child: EmptyWidget()),
                    ],
                  ),
                );

              }

              return SliverGrid.builder(
                itemBuilder: (context, index) {
                  String uId = clients[index].uId;
                  final orders = context
                      .read<ClientsCubit>()
                      .getOrdersForUser(uId);
                  return CustomerCard(
                    user: clients[index],
                    orders: orders,
                  );
                },
                itemCount: clients.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio:2.1,
              )
              );
            }

            return SliverList.builder(
              itemBuilder: (context, index) =>
                  Skeletonizer(
                    child: CustomerCard(
                      user: UserEntity(
                        userName: '---------------------',
                        email: '--------------------------------',
                        uId: '---------------------',
                        phone: '---------------------',
                        password: '---------------------',
                      ), orders: [],
                    ),
                  ),
              itemCount: 10,
            );
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
      ],
    );
  }
}
