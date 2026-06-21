import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../view_model/edit_product_cubit.dart';
import '../widgets/edit_product_view_body.dart';

class EditProductView extends StatelessWidget {
  final ProductEntity product;
  const EditProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProductCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
          backgroundColor: AppColor.mainColor,
          title: Text(
            'تعديل المنتج',
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(color: Colors.white),
          ),
        ),
        body: EditProductViewBody(product: product,),
      ),
    );
  }
}
