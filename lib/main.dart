import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_dashboard/core/utils/theme_manager.dart';
import 'core/utils/route_manager.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      theme: ThemeManager.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GenerateRoute.generateRoute,
      initialRoute: RouteManager.addProductView,
    );
  }
}
