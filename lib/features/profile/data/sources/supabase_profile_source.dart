abstract class ProfileRemoteSource {
  Future<Map<String, dynamic>> fetchProfile(String userId);
  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> payload);
  Future<String> uploadAvatar({required String userId, required String filePath});
}

class SupabaseProfileSource implements ProfileRemoteSource {
  // TODO: inject Supabase client
  @override Future<Map<String, dynamic>> fetchProfile(String userId) => throw UnimplementedError();
  @override Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> payload) => throw UnimplementedError();
  @override Future<String> uploadAvatar({required String userId, required String filePath}) => throw UnimplementedError();
}
