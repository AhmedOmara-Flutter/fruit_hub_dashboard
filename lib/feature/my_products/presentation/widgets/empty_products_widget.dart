import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../generated/assets.dart';

class EmptyProductsWidget extends StatelessWidget {
  const EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
        Assets.json.empty,
        height: MediaQuery.sizeOf(context).height * 0.30,
        fit: BoxFit.fill
    );
  }
}
