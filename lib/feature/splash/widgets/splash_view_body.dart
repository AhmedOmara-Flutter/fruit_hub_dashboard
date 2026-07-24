import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/route_manager.dart';
import '../../../core/utils/style_manager.dart';
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

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    logoSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    logoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
   // goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.splashBg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
          ),
          FadeTransition(
            opacity: logoFade,
            child: SlideTransition(
              position: logoSlide,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    Assets.images.appLogo.path,
                    height: 350.h,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 60.h,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.star_rounded,
                              color: AppColor.mainColor,
                              size: 16.sp,
                            ),
                          ),
                          const TextSpan(text: '  '),
                          TextSpan(
                            text: 'من أول لقمة تبدأ الحكاية',
                            style: StyleManager.font14Weight600.copyWith(
                              color: AppColor.mainColor,
                            ),
                          ),
                          const TextSpan(text: '  '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.star_rounded,
                              color: AppColor.mainColor,
                              size: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: AppColor.mainColor,
                    strokeWidth: 3.w,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'جاري التحميل',
                    style: StyleManager.font14Weight600.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToHome() {
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        RouteManager.main,
      );

    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}