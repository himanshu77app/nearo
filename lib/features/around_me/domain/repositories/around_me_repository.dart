import '../../../../core/errors/failures.dart';
import '../entities/nearby_user.dart';

abstract class AroundMeRepository {
  Future<(List<NearbyUser>?, Failure?)> fetchNearbyUsers({required double lat, required double lng, double radiusKm = 2});
}
