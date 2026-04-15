import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_dashboard/core/utils/theme_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/utils/route_manager.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: 'https://wplubouwksawibitfhlj.supabase.co',
    anonKey: 'sb_publishable_28OdrvHF22OZhJIOnmQGFQ_T98mgadn',
  );



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
