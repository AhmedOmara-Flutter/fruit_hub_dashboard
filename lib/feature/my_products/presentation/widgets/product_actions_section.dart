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
      children: [
        SizedBox(width: 60),
        EditProductButton(product: product),
        SizedBox(width: 10),
        RemoveProductButton(product: product),
        SizedBox(width: 10),
        RemoveOfferButton(
          hasOffer: hasOffer,
          offer: offer,
          product: product,
        ),
        SizedBox(width: 60),

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
            color: AppColor.red,
            label: state.errMessage,
          );
        }
      },
      child: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColor.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColor.red.withOpacity(0.7),
            ),
          ),
          child: InkWell(
            onTap: () {
              CustomShowDialog.show(
                context,
                title: 'حذف المنتج',
                content: Text(
                  'هل أنت متأكد أنك تريد حذف هذا المنتج؟',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
                cancel: () => Navigator.pop(context),
                accept: () {
                  context
                      .read<ProductsCubit>()
                      .deleteProduct(product.id ?? '');
                  Navigator.pop(context);
                },
                flag: Icons.shopping_bag,
                color: AppColor.red,
              );
            },
            child: Text(
              'حذف',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.white,
              ),
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
        if (state is DeleteOfferFailure) {
          customShowSnakeBar(
            context,
            color: AppColor.red,
            label: state.message,
          );
        }
      },
      child: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: hasOffer ? AppColor.mainColor.withOpacity(0.8) : AppColor
                .card,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColor.border,
            ),
          ),
          child: InkWell(
            onTap: () {
              if (hasOffer) {
                CustomShowDialog.show(
                  context,
                  title: 'حذف العرض',
                  content: Text(
                    'هل أنت متأكد أنك تريد حذف هذا العرض؟',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                  cancel: () => Navigator.pop(context),
                  accept: () {
                    context.read<OffersCubit>().deleteOffer(offer!);
                    Navigator.pop(context);
                  },
                  flag: Icons.local_offer_outlined,
                  color: AppColor.red,
                );
              } else {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColor.background,
                  builder: (_) => AddOfferBottomSheet(
                    product: product,
                  ),
                );
              }
            },
            child: Text(
              hasOffer ? 'حذف عرض' : 'إضافة عرض',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.white,
              ),
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
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.green.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColor.green.withOpacity(0.7),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteManager.editProductView,
              arguments: product,
            );
          },
          child: Text(
            'تعديل',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}