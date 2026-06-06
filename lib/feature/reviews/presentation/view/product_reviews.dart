import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/widgets/product_reviews_body.dart';

import '../../../add_product/domain/entities/product_entity.dart';

class ProductReviewsView extends StatelessWidget {
 final ProductEntity product;
  const ProductReviewsView({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: ProductReviewsViewBody(product: product,),
    );
  }
}
