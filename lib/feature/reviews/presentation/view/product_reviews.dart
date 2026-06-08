import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/widgets/product_reviews_body.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../add_product/domain/entities/product_entity.dart';

class ProductReviewsView extends StatelessWidget {
 final ProductEntity product;
  const ProductReviewsView({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: AppColor.mainColor,
        title: Text('عرض التعليقات',style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Colors.white
        ),),
      ),
      body: ProductReviewsViewBody(product: product,),
    );
  }
}
