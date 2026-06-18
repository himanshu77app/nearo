abstract class AroundMeRemoteSource {
  Future<List<Map<String, dynamic>>> fetchNearbyUsers({required double lat, required double lng, required double radiusKm});
}

class SupabaseAroundMeSource implements AroundMeRemoteSource {
  // TODO: inject Supabase client
  @override
  Future<List<Map<String, dynamic>>> fetchNearbyUsers({required double lat, required double lng, required double radiusKm}) => throw UnimplementedError();
}
