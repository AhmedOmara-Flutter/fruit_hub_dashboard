import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class BackgroundCard extends StatelessWidget {
  final Widget child;
  final String label;
  final String subLabel;
  final IconData icon;

  const BackgroundCard({
    super.key, required this.child, required this.label, required this.subLabel, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffFAFAFB),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)),
              border: Border.all(
                  color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.circular(
                        8),
                    border: Border.all(
                        color: Colors.grey.shade200),
                  ),
                  child: Icon(icon,
                      color: Colors.white, size: 18),
                ),
                SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start,
                  children: [
                    Text(label, style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.8))),
                    SizedBox(height: 4),
                    Text(subLabel,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey),),
                  ],
                )
              ],
            ),
          ),
          child

        ],
      ),
    );
  }
}
