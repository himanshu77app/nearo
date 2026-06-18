import '../../../../core/errors/failures.dart';
import '../entities/plan.dart';

abstract class PlansRepository {
  Future<(List<Plan>?, Failure?)> fetchNearbyPlans({required double lat, required double lng, double radiusKm = 5});
  Future<(Plan?, Failure?)> fetchPlanById(String id);
  Future<(Plan?, Failure?)> createPlan(Plan plan);
  Future<(void, Failure?)> joinPlan(String planId);
  Future<(void, Failure?)> leavePlan(String planId);
}
