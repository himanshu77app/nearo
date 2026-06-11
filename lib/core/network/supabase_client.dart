import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ─────────────────────────────────────────────
// Supabase initialiser — call once in main
// ─────────────────────────────────────────────
class SupabaseConfig {
  SupabaseConfig._();

  static Future<void> initialize() async {
    await Supabase.initialize(
      url:      dotenv.env['SUPABASE_URL']!,
      anonKey:  dotenv.env['SUPABASE_ANON_KEY']!,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );
  }

  /// Convenience getter — use anywhere after init
  static SupabaseClient get client => Supabase.instance.client;
}
