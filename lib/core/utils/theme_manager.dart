import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,

    ///appBar
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
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
        backgroundColor: const Color(0xff1B5E37),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(double.infinity, 65),
      ),
    ),

      ///outlined button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Color(0xffDDDFDF))
          ),
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

    ),

      /// input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintStyle: StyleManager.font13Weight700,
        labelStyle: StyleManager.font13Weight700,
        suffixIconColor: Color(0xffC9CECF),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),


      )
  );


}
