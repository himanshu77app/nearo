// ─────────────────────────────────────────────
// Supabase table & bucket names — single source of truth
// ─────────────────────────────────────────────
class SupabaseTables {
  SupabaseTables._();

  static const String users        = 'users';
  static const String plans        = 'plans';
  static const String planMembers  = 'plan_members';
  static const String liveRequests = 'live_requests';
  static const String discoveries  = 'discoveries';
  static const String messages     = 'messages';
  static const String completions  = 'completions';
  static const String notifications = 'notifications';
}

class SupabaseBuckets {
  SupabaseBuckets._();

  static const String activityMedia = 'activity-media';
  static const String avatars       = 'avatars';
}

class SupabaseFunctions {
  SupabaseFunctions._();

  static const String joinPlan          = 'join-plan';
  static const String publishPlan       = 'publish-plan';
  static const String sendPush          = 'send-push';
  static const String verifyCompletion  = 'verify-completion';
  static const String updateReliability = 'update-reliability';
}
