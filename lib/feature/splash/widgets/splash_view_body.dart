import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/route_manager.dart';
import '../../../generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Timer? _timer;

  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.images.splashTop.path)],
        ),
        SvgPicture.asset(Assets.images.splashCenter.path),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [SvgPicture.asset(Assets.images.splashBottom.path)],
        ),
      ],
    );
  }

  void goToHome() {
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteManager.main);
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
