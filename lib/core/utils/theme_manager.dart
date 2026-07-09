import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.background,
    ///appBar
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0.0,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: StyleManager.font19Weight700,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    ///elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: AppColor.mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          minimumSize: const Size(double.infinity, 65),
        ),
      ),

    ///text theme
    textTheme: TextTheme(
      //title in onboarding
      titleLarge: StyleManager.font23Weight700,
      //description in onboarding
      titleMedium: StyleManager.font13Weight600,
      // skip button in onboarding
      titleSmall: StyleManager.font13Weight400,
      // button label
      labelSmall: StyleManager.font16Weight700,
      //googleButton && text under button
      labelMedium: StyleManager.font16Weight600,
      //button in featured item
      labelLarge: StyleManager.font13Weight700,
      displaySmall: StyleManager.font19Weight700,
      bodyLarge: StyleManager.font11Weight400,
      bodyMedium: StyleManager.font14Weight600
    ),
  );
}
