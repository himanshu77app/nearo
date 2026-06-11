import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/network/supabase_client.dart';

// ─────────────────────────────────────────────
// One-shot bootstrap — call before runApp
// ─────────────────────────────────────────────
Future<void> bootstrap({required String environment}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Transparent status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0x00000000),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));

  // Load env
  await dotenv.load(fileName: 'env/.env.$environment');

  // Init Supabase
  await SupabaseConfig.initialize();

  if (kDebugMode) {
    debugPrint('[Nearo] Bootstrap complete · env=$environment');
  }
}
