import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/widgets/reviews_view_body.dart';

import '../../../../generated/assets.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReviewsViewBody(
        image: 'https://i.pravatar.cc/300',
        productName: 'tt4g',
        reviewText: 'tg4t',
        customerName: '',
        date: '',
        rating: 0,
        customerImage: '',
      ),
    );
  }
}
