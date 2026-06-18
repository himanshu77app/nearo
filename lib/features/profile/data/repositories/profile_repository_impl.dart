import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../sources/supabase_profile_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteSource _remote;

  const ProfileRepositoryImpl(this._remote);

  @override
  Future<(Profile?, Failure?)> fetchProfile(String userId) async {
    try {
      final data = await _remote.fetchProfile(userId);
      return (Profile.fromJson(data), null);
    } on NotFoundException catch (e) {
      return (null, NotFoundFailure(e.message ?? 'Profile not found'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(Profile?, Failure?)> updateProfile(Profile profile) async {
    try {
      final data = await _remote.updateProfile(profile.toJson());
      return (Profile.fromJson(data), null);
    } on ServerException catch (e) {
      return (null, ServerFailure(e.message ?? 'Could not update profile'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(String?, Failure?)> uploadAvatar({required String userId, required String filePath}) async {
    try {
      final url = await _remote.uploadAvatar(userId: userId, filePath: filePath);
      return (url, null);
    } on ServerException catch (e) {
      return (null, ServerFailure(e.message ?? 'Upload failed'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }
}
