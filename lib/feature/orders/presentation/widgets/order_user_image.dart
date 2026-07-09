
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';

class OrderUserImage extends StatelessWidget {
  const OrderUserImage({
    super.key,
    this.onTap,

  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:ClipOval(
        child: Image.asset(
          Assets.images.customer.path,
          width: 60.w,
          height: 60.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}