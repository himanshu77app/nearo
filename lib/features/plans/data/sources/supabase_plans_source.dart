abstract class PlansRemoteSource {
  Future<List<Map<String, dynamic>>> fetchNearbyPlans({required double lat, required double lng, required double radiusKm});
  Future<Map<String, dynamic>> fetchPlanById(String id);
  Future<Map<String, dynamic>> createPlan(Map<String, dynamic> payload);
  Future<void> joinPlan(String planId);
  Future<void> leavePlan(String planId);
}

class SupabasePlansSource implements PlansRemoteSource {
  // TODO: inject Supabase client
  @override Future<List<Map<String, dynamic>>> fetchNearbyPlans({required double lat, required double lng, required double radiusKm}) => throw UnimplementedError();
  @override Future<Map<String, dynamic>> fetchPlanById(String id) => throw UnimplementedError();
  @override Future<Map<String, dynamic>> createPlan(Map<String, dynamic> payload) => throw UnimplementedError();
  @override Future<void> joinPlan(String planId) => throw UnimplementedError();
  @override Future<void> leavePlan(String planId) => throw UnimplementedError();
}
