import '../../../../core/errors/failures.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<(Profile?, Failure?)> fetchProfile(String userId);
  Future<(Profile?, Failure?)> updateProfile(Profile profile);
  Future<(String?, Failure?)> uploadAvatar(String filePath);
}
