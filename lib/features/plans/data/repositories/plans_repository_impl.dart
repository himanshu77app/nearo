import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/plan.dart';
import '../../domain/repositories/plans_repository.dart';
import '../sources/supabase_plans_source.dart';

class PlansRepositoryImpl implements PlansRepository {
  final PlansRemoteSource _remote;

  const PlansRepositoryImpl(this._remote);

  @override
  Future<(List<Plan>?, Failure?)> fetchNearbyPlans({required double lat, required double lng, double radiusKm = 5}) async {
    try {
      final data = await _remote.fetchNearbyPlans(lat: lat, lng: lng, radiusKm: radiusKm);
      return (data.map(Plan.fromJson).toList(), null);
    } on NetworkException catch (e) {
      return (null, NetworkFailure(e.message ?? 'No internet'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(Plan?, Failure?)> fetchPlanById(String id) async {
    try {
      final data = await _remote.fetchPlanById(id);
      return (Plan.fromJson(data), null);
    } on NotFoundException catch (e) {
      return (null, NotFoundFailure(e.message ?? 'Plan not found'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(Plan?, Failure?)> createPlan(Plan plan) async {
    try {
      final data = await _remote.createPlan(plan.toJson());
      return (Plan.fromJson(data), null);
    } on ServerException catch (e) {
      return (null, ServerFailure(e.message ?? 'Server error'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(void, Failure?)> joinPlan(String planId) async {
    try {
      await _remote.joinPlan(planId);
      return (null, null);
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(void, Failure?)> leavePlan(String planId) async {
    try {
      await _remote.leavePlan(planId);
      return (null, null);
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }
}
