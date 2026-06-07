import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../generated/assets.dart';

class SkeletonizerProductItem extends StatelessWidget {
  const SkeletonizerProductItem({
    super.key,
    required this.productName,
    required this.orderCount,
    required this.image,
    required this.medal,
  });

  final String productName;
  final String orderCount;
  final String image;
  final String medal;


  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(medal, height: 30, width: 30,),

            const SizedBox(width: 12),
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(image),
              ),
            ),
            const SizedBox(width: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  '$orderCount طلب',
                  style: Theme
                      .of(
                    context,
                  )
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Color(0xffF5F9F6),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        orderCount, style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(
                          color: AppColor.mainColor
                      ),),
                      SizedBox(width: 5,),
                      Image.asset(Assets.images.rise.path, height: 10, width: 10,color: AppColor.mainColor,)

                    ],
                  ),
                  Text('اجمالي الطلبات',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 11
                  ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
