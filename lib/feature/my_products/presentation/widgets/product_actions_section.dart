import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_dialog.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/route_manager.dart';

import '../../../../core/cubit/offers_cubit/offers_cubit.dart';
import '../../../../core/cubit/products_cubit/products_cubit.dart';
import '../../../../core/entities/offer_entity.dart';
import '../../../../core/helper_function/custom_show_snake_bar.dart';
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
        EditProductButton(product: product),
        const SizedBox(width: 5),
        RemoveProductButton(product: product),
        const SizedBox(width: 5),
        RemoveOfferButton(hasOffer: hasOffer, offer: offer, product: product),
      ],
    );
  }
}

class RemoveProductButton extends StatelessWidget {
  const RemoveProductButton({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is DeleteProductError) {
          customShowSnakeBar(
            context,
            color: Colors.red,
            label: state.errMessage,
          );
        }
        if (state is DeleteProductSuccess) {
          customShowSnakeBar(
            context,
            color: AppColor.mainColor,
            label: 'تم حذف المنتج بنجاح',
          );
        }


      },
      child: Expanded(
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
              CustomShowDialog.show(
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
                  context.read<ProductsCubit>().deleteProduct(
                      product.id ?? '');
                    Navigator.pop(context);
                },
                flag: Icons.shopping_bag,
                color: Colors.red,
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
    );
  }
}

class RemoveOfferButton extends StatelessWidget {
  const RemoveOfferButton({
    super.key,
    required this.hasOffer,
    required this.offer,
    required this.product,
  });

  final bool hasOffer;
  final OfferEntity? offer;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OffersCubit, OfferState>(
      listener: (context, state) {
        print("STATE: $state");
          if (state is DeleteOfferSuccess) {
            customShowSnakeBar(
              context,
              color: AppColor.mainColor,
              label: 'تم حذف العرض بنجاح',
            );
          }

          if (state is DeleteOfferFailure) {
            customShowSnakeBar(
              context,
              color: Colors.red,
              label: state.message,
            );
          }
      },
      child: Expanded(
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
              CustomShowDialog.show(
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
                    context.read<OffersCubit>().deleteOffer(offer!);
                    Navigator.pop(context);

                  },
                  flag: Icons.local_offer_outlined,
                  color: Colors.red
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
    );
  }
}

class EditProductButton extends StatelessWidget {
  const EditProductButton({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteManager.editProductView,
                arguments: product);
          },
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
    );
  }
}
