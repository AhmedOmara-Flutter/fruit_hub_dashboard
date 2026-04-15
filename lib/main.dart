import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_dashboard/core/utils/theme_manager.dart';
import 'core/utils/route_manager.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final supabase = SupabaseClient('supabaseUrl', 'supabaseKey');
  final storageResponse = await supabase
      .storage
      .createBucket('avatars');
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
