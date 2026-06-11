import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/nearby_user.dart';
import '../../domain/repositories/around_me_repository.dart';
import '../sources/supabase_around_me_source.dart';

class AroundMeRepositoryImpl implements AroundMeRepository {
  final AroundMeRemoteSource _remote;

  const AroundMeRepositoryImpl(this._remote);

  @override
  Future<(List<NearbyUser>?, Failure?)> fetchNearbyUsers({required double lat, required double lng, double radiusKm = 2}) async {
    try {
      final data = await _remote.fetchNearbyUsers(lat: lat, lng: lng, radiusKm: radiusKm);
      return (data.map(NearbyUser.fromJson).toList(), null);
    } on NetworkException catch (e) {
      return (null, NetworkFailure(e.message ?? 'No internet'));
    } on PermissionException catch (e) {
      return (null, PermissionFailure(e.message ?? 'Location permission denied'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }
}
