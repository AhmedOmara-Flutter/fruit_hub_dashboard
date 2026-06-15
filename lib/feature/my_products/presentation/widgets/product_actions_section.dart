import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_dialog.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';

import '../../../../core/cubit/offers_cubit/offers_cubit.dart';
import '../../../offers/domain/entities/offer_entity.dart';
import 'add_offer_bottom_sheet.dart';

class ProductActionsSection extends StatelessWidget {
  final ProductEntity product;
  final bool hasOffer;
  final OfferEntity? offer;

  const ProductActionsSection({
    super.key,
    required this.hasOffer,
    required this.product,
    this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
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
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      const SizedBox(width: 5),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey),
                ),
                cancel: () => Navigator.pop(context),
                accept: () {
                  // context.read<MyProductsCubit>().deleteProduct(product.id ?? '');
                },
                icon: Icons.shopping_bag_outlined,
              );
            },
            child: Text(
              'حذف',
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      const SizedBox(width: 5),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: hasOffer
              ? InkWell(
            onTap: () {
              customShowDialog(
                context,
                title: 'حذف العرض',
                content: Text(
                  'هل أنت متأكد أنك تريد حذف هذا العرض؟',
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey),
                ),
                cancel: () => Navigator.pop(context),
                accept: () {
                  final cubit = context.read<OffersCubit>();
                  cubit.deleteOffer(offer!);
                },
                icon: Icons.local_offer_outlined,
                confirmChild: BlocBuilder<OffersCubit, OfferState>(
                  builder: (context, state) {
                    final isLoading =
                    state is DeleteOfferLoading;

                    return isLoading
                        ? const SizedBox(
                      height: 18,
                      width: 18,
                      child:
                      CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : Text(
                      'تأكيد الحذف',
                      textAlign: TextAlign.center,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                          color: Colors.white),
                    );
                  },
                ),
              );
            },
            child: Text(
              'حذف عرض',
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          )
              : InkWell(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) =>
                    AddOfferBottomSheet(product: product),
              );
            },
            child: Text(
              'اضافه عرض',
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    ],
    );
  }
}
