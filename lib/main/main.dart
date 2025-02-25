import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verymemo/common/configs/app_config.dart';
import 'package:verymemo/firebase_options.dart';
import 'package:verymemo/main/app.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConfig.instance.supabaseUrl,
    anonKey: AppConfig.instance.supabaseAnonKey,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: App()));
}
