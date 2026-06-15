
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderUserImage extends StatelessWidget {
  const OrderUserImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }
}