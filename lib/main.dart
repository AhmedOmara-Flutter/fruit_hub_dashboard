import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/src/src.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: 'https://wplubouwksawibitfhlj.supabase.co',
    anonKey: 'sb_publishable_28OdrvHF22OZhJIOnmQGFQ_T98mgadn',
  );

  runApp(const MyApp());
}

