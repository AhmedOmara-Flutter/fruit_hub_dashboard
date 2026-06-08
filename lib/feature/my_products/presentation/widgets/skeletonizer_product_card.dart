import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_actions_section.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_details_section.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_header_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerProductCard extends StatelessWidget {
  final ProductEntity product;


  const SkeletonizerProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {

    return Skeletonizer(
      child: Container(
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
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ProductHeaderSection(product),
              const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
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
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: InkWell(
                      onTap: () {

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
            ),              SizedBox(height: 10),
              ProductDetailsSection(product),
            ],
          ),
        ),
      ),
    );
  }
}
