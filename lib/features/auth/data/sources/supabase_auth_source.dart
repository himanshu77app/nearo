import '../../../../core/errors/exceptions.dart';

abstract class AuthRemoteSource {
  Future<void> sendOtp(String phone);
  Future<Map<String, dynamic>> verifyOtp({required String phone, required String otp});
  Future<void> signOut();
  Stream<Map<String, dynamic>?> get authStateChanges;
}

class SupabaseAuthSource implements AuthRemoteSource {
  // TODO: inject Supabase client
  @override
  Future<void> sendOtp(String phone) async {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> verifyOtp({required String phone, required String otp}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }

  @override
  Stream<Map<String, dynamic>?> get authStateChanges => throw UnimplementedError();
}
