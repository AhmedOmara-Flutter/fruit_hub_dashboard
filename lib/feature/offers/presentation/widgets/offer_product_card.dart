import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper_function/custom_show_dialog.dart';
import '../../../../core/helper_function/custom_show_snake_bar.dart';
import '../../../../core/utils/app_color.dart';
import '../../domain/entities/offer_entity.dart';
import '../view_model/offer_cubit.dart';

class OfferProductCard extends StatelessWidget {
  final OfferEntity offer;

  const OfferProductCard({super.key, required this.offer,});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfferCubit, OfferState>(
      listener: (context, state) {
        if (state is DeleteOfferSuccess) {
          Navigator.pop(context);
        }

        if (state is DeleteOfferFailure) {
          Navigator.pop(context);
          customShowSnakeBar(context, color: Colors.red, label: state.message);
        }
      },

      child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              offer.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // Middle content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.name,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.black),
                ),

                const SizedBox(height: 6),

                Text(
                  "قبل الخصم: ${offer.priceBeforeDiscount.toStringAsFixed(2)} جنيه",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey[700]),
                ),

                const SizedBox(height: 6),

                // Start & End Dates
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // left labels + arrow
                    Column(
                      children: [
                        Text(
                          "من",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 4),
                        const Icon(
                          Icons.arrow_downward,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "إلى",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),

                    const SizedBox(width: 10),

                    // dates
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _formatDate(offer.startDate),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),

                          const SizedBox(height: 18),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _formatDate(offer.endDate),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Right section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Discount badge
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "${offer.discountPercentage} % خصم",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColor.mainColor),
                ),
              ),

              Text(
                "بعد الخصم",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              Text(
                "${offer.priceAfterDiscount.toStringAsFixed(2)} جنيه",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: AppColor.mainColor),
              ),

              const SizedBox(height: 8),

              // Delete button
              InkWell(
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
                      context
                          .read<OfferCubit>()
                          .deleteOffer(offer.id ?? '');
                    },
                    icon: Icons.local_offer_outlined,
                    confirmChild: BlocBuilder<OfferCubit, OfferState>(
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
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal:15,vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
);
  }
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}