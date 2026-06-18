// ─────────────────────────────────────────────
// App-wide constants
// ─────────────────────────────────────────────
class AppConstants {
  AppConstants._();

  // App
  static const String appName = 'Nearo';
  static const String appTagline = 'Find your people. Make it happen.';

  // Plan settings
  static const int maxSpotsPerPlan = 20;
  static const int minSpotsPerPlan = 1;
  static const int planExpiryHours = 48;
  static const int liveRequestMaxMinutes = 120;

  // Geo
  static const double defaultRadiusKm = 5.0;
  static const List<double> radiusOptions = [1, 5, 10, 25];

  // Chat
  static const int chatArchiveHours = 48;
  static const int messagePageSize = 50;

  // Reliability score
  static const int minPlansForScore = 3;

  // Pagination
  static const int plansPageSize = 20;
  static const int livePageSize = 20;
  static const int discoveriesPageSize = 20;
}
