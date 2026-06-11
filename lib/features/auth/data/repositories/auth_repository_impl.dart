import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/supabase_auth_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remote;

  const AuthRepositoryImpl(this._remote);

  @override
  Future<(AppUser?, Failure?)> sendOtp(String phone) async {
    try {
      await _remote.sendOtp(phone);
      return (null, null);
    } on NetworkException catch (e) {
      return (null, NetworkFailure(e.message ?? 'No internet'));
    } on AuthException catch (e) {
      return (null, AuthFailure(e.message ?? 'Auth error'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(AppUser?, Failure?)> verifyOtp({required String phone, required String otp}) async {
    try {
      final data = await _remote.verifyOtp(phone: phone, otp: otp);
      final user = AppUser(
        id: data['id'] as String,
        phone: phone,
        displayName: data['display_name'] as String?,
        avatarUrl: data['avatar_url'] as String?,
        isOnboarded: data['is_onboarded'] as bool? ?? false,
        createdAt: DateTime.parse(data['created_at'] as String),
      );
      return (user, null);
    } on AuthException catch (e) {
      return (null, AuthFailure(e.message ?? 'OTP verification failed'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(void, Failure?)> signOut() async {
    try {
      await _remote.signOut();
      return (null, null);
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Stream<AppUser?> get authStateChanges => _remote.authStateChanges.map(
        (data) => data == null
            ? null
            : AppUser(
                id: data['id'] as String,
                phone: data['phone'] as String,
                isOnboarded: data['is_onboarded'] as bool? ?? false,
                createdAt: DateTime.parse(data['created_at'] as String),
              ),
      );
}
