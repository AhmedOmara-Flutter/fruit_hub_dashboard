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

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  Timer? _timer;

  late AnimationController _controller;

  late Animation<Offset> logoSlide;
  late Animation<double> logoFade;

  late Animation<Offset> topSlide;
  late Animation<Offset> bottomSlide;

  @override
  void initState() {
    super.initState();

    /// ================= ANIMATION CONTROLLER =================
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    /// ================= ANIMATIONS =================
    topSlide = Tween<Offset>(
      begin: const Offset(1, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    logoSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    logoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    bottomSlide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    /// start animation
    _controller.forward();

    /// navigation
    goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        /// ================= TOP =================
        SlideTransition(
          position: topSlide,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.images.splashTop.path),
            ],
          ),
        ),

        /// ================= LOGO =================
        FadeTransition(
          opacity: logoFade,
          child: SlideTransition(
            position: logoSlide,
            child: Image.asset(Assets.images.qtefNoBackground.path),
          ),
        ),

        /// ================= BOTTOM =================
        SlideTransition(
          position: bottomSlide,
          child: SvgPicture.asset(Assets.images.splashBottom.path),
        ),
      ],
    );
  }

  /// ================= NAVIGATION LOGIC =================
  void goToHome() {
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,RouteManager.main);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}