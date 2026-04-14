import 'package:flutter/material.dart';

class CustomIsFeatured extends StatelessWidget {
  final bool isFeatured;
  final Function()? onTap;

  const CustomIsFeatured({super.key, required this.isFeatured, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isFeatured ? Color(0xff2D9F5D) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xffDDDFDF)),
            ),
            child: isFeatured
                ? Icon(Icons.done, size: 17, color: Colors.white)
                : null,
          ),

          Text(
            'المنتج مميز',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
