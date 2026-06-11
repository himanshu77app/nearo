abstract class LiveRemoteSource {
  Future<List<Map<String, dynamic>>> fetchActiveSessions();
  Future<Map<String, dynamic>> startSession(String title);
  Future<void> endSession(String sessionId);
  Stream<List<Map<String, dynamic>>> watchActiveSessions();
}

class SupabaseLiveSource implements LiveRemoteSource {
  // TODO: inject Supabase client — use Supabase Realtime for watchActiveSessions
  @override Future<List<Map<String, dynamic>>> fetchActiveSessions() => throw UnimplementedError();
  @override Future<Map<String, dynamic>> startSession(String title) => throw UnimplementedError();
  @override Future<void> endSession(String sessionId) => throw UnimplementedError();
  @override Stream<List<Map<String, dynamic>>> watchActiveSessions() => throw UnimplementedError();
}
