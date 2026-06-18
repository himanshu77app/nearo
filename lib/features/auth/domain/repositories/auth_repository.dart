import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<(AppUser?, Failure?)> sendOtp(String phone);
  Future<(AppUser?, Failure?)> verifyOtp({required String phone, required String otp});
  Future<(void, Failure?)> signOut();
  Stream<AppUser?> get authStateChanges;
}
