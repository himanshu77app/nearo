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
  try {
    await dotenv.load(fileName: 'env/.env.$environment');
  } catch (e) {
    if (kDebugMode) debugPrint('[Nearo] No env file — running with static UI only');
  }

  // Init Supabase (skip if no real credentials)
  try {
    final url = dotenv.env['SUPABASE_URL'] ?? '';
    final key = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
    if (url.isNotEmpty && !url.contains('placeholder')) {
      await SupabaseConfig.initialize();
    } else {
      if (kDebugMode) debugPrint('[Nearo] Supabase skipped — placeholder credentials');
    }
  } catch (e) {
    if (kDebugMode) debugPrint('[Nearo] Supabase init skipped: $e');
  }

  if (kDebugMode) {
    debugPrint('[Nearo] Bootstrap complete · env=$environment');
  }
}
