import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/feature/my_products/app/repos/my_product_repo_impl.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/my_products_view_body.dart';

import '../../../../core/repos/product_repo/product_repo_impl.dart';
import '../view_model/my_products_cubit.dart';

class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyProductsCubit(MyProductRepoImpl(FirestoreDatabase()),
              ProductRepoImpl(FirestoreDatabase())),
        child: MyProductsViewBody()
    );
  }
}
