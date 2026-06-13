import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../generated/assets.dart';

class BuildOrderCard extends StatefulWidget {
  const BuildOrderCard({super.key});

  @override
  State<BuildOrderCard> createState() => _BuildOrderCardState();
}

class _BuildOrderCardState extends State<BuildOrderCard> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CachedNetworkImage(
                    imageUrl: '"https://i.pravatar.cc/300',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Skeletonizer(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Assets.images.img.path),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '# اوردر - 1',
                              style: Theme.of(context).textTheme.labelMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'احمد عماره',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              ';tv hgs,vf[d lv;, ;tv hhg,.djj hgyvfd',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'products',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade300,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                'جاري الانتظار',
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '340 ج.م',
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(color: AppColor.mainColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'time',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Spacer(),
                        Icon(
                          Icons.location_city_outlined,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'كفر الشوربجي',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'تاكيد';
                  });
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: selected == 'تاكيد'
                            ? AppColor.mainColor
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Icon(
                        Icons.done,
                        size: 20,
                        color:selected == 'تاكيد'
                            ? Colors.white
                            : Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'تاكيد',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: selected == 'تاكيد'
                            ? AppColor.mainColor
                            : Colors.grey.shade600
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'انتهاء';
                  });
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: selected == 'انتهاء'
                            ? AppColor.mainColor
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Icon(
                        Icons.done,
                        size: 20,
                        color: selected == 'انتهاء'
                            ? Colors.white
                            : Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'انتهاء',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: selected == 'انتهاء'
                              ? AppColor.mainColor
                              : Colors.grey.shade600

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
