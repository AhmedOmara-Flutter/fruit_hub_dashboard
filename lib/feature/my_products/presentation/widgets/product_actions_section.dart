import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_dialog.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

import '../view_model/my_products_cubit.dart';

class ProductActionsSection extends StatelessWidget {
  final ProductEntity product;

  const ProductActionsSection(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProductsCubit, MyProductsState>(
      builder: (context, state) {
        print('CURRENT STATE => ${state.runtimeType}');

        return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: InkWell(
              onTap: () {},
              child: Text(
                'تعديل',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: InkWell(
                  onTap: () {
                    customShowDialog(
                      context,
                      title: 'حذف المنتج',
                      content: Text(
                        'هل أنت متأكد أنك تريد حذف هذا المنتج؟',
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.grey),
                      ),
                      cancel: () {
                        Navigator.pop(context);
                      },
                      accept: () {
                        context.read<MyProductsCubit>().deleteProduct(
                          product.id ?? '',
                        );
                      },
                    );
                  },
                  child: Text(
                'حذف',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
      },
    );
  }
}
