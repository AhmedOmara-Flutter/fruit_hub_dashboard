import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_actions_section.dart';
import 'package:fruit_hub_dashboard/core/entities/offer_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final OfferEntity ?offer;

  const ProductCard({
    super.key,
    required this.product, this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasOffer = offer != null;
    final discount = offer?.discountPercentage ?? 0;
    final oldPrice = offer?.priceBeforeDiscount ?? product.price;
    final newPrice = offer?.priceAfterDiscount ?? product.price;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey.shade100,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      product.image ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                    ),
                  ),

                  /// Badge Offer
                  if (hasOffer)
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '-${discount.toInt()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Price
                    hasOffer
                        ? Row(
                      children: [
                        Text(
                          '$oldPrice ج',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$newPrice ج',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                        : Text(
                      '${product.price} ج',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (hasOffer)
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.withOpacity(.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📅  من ${_formatDate(offer!.startDate)} ← إلى ${_formatDate(offer!.endDate)}',
                      style:Theme.of(context).textTheme.titleMedium ,),
                  ],
                ),),
                 const SizedBox(height: 10),
          ProductActionsSection(
              product: product, hasOffer: hasOffer, offer: offer),
        ],
      ),
    );
  }
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

// class _InfoItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String value;
//
//   const _InfoItem({
//     required this.icon,
//     required this.title,
//     required this.value,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: Colors.green),
//         const SizedBox(width: 8),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey.shade600,
//               ),
//             ),
//             Text(
//               value,
//               style: const TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
// // import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_actions_section.dart';
// // import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_details_section.dart';
// // import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_header_section.dart';
// //
// // import '../../../offers/domain/entities/offer_entity.dart';
// //
// // class ProductCard extends StatelessWidget {
// //   final ProductEntity product;
// //   final OfferEntity? offer;
// //
// //   const ProductCard({super.key, required this.product, this.offer});
// //
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border.all(color: Colors.grey.shade200),
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(10),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(.05),
// //             blurRadius: 10,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Container(
// //         padding: const EdgeInsets.all(10),
// //         child: Column(
// //           children: [
// //             ProductHeaderSection(product),
// //             const SizedBox(height: 8),
// //             ProductActionsSection(product),
// //             SizedBox(height: 10),
// //             ProductDetailsSection(product),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:fruit_hub_dashboard/core/helper_function/get_date_formate.dart';
// import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
//
// class ProductCard extends StatelessWidget {
//   final ProductEntity product;
//
//   const ProductCard({
//     super.key,
//     required this.product,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.06),
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           /// Header
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(14),
//                 child: Image.network(
//                   product.image ?? '',
//                   width: 90,
//                   height: 90,
//                   fit: BoxFit.cover,
//                   errorBuilder: (_, __, ___) =>
//                   const Icon(Icons.image_not_supported),
//                 ),
//               ),
//
//               const SizedBox(width: 16),
//
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       product.name,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//
//                     const SizedBox(height: 6),
//
//                     Text(
//                       product.description,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 13,
//                       ),
//                     ),
//
//                     const SizedBox(height: 10),
//
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 5,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.green.withOpacity(.1),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Text(
//                             '${product.price} جنيه',
//                             style: const TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(width: 8),
//
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 5,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.orange.withOpacity(.1),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Text(
//                             product.category,
//                             style: const TextStyle(
//                               color: Colors.orange,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 16),
//
//           Divider(color: Colors.grey.shade200),
//
//           const SizedBox(height: 12),
//
//           /// Details
//           Row(
//             children: [
//               Expanded(
//                 child: _InfoItem(
//                   icon: Icons.inventory_2_outlined,
//                   title: "المخزون",
//                   value: "50 قطعة",
//                 ),
//               ),
//
//               Expanded(
//                 child: _InfoItem(
//                   icon: Icons.calendar_month_outlined,
//                   title: "تاريخ الإضافة",
//                   value: getDateOnly(product.createdAt),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 16),
//
//           /// Actions
//           Row(
//             children: [
//               Expanded(
//                 child: OutlinedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.edit_outlined),
//                   label: const Text("تعديل"),
//                 ),
//               ),
//
//               const SizedBox(width: 10),
//
//               Expanded(
//                 child: ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.rate_review_outlined),
//                   label: const Text("المراجعات"),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _InfoItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String value;
//
//   const _InfoItem({
//     required this.icon,
//     required this.title,
//     required this.value,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           icon,
//           size: 20,
//           color: Colors.green,
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.grey.shade600,
//                   fontSize: 12,
//                 ),
//               ),
//               Text(
//                 value,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
