import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/phone_entry_screen.dart';
import '../../features/auth/presentation/screens/otp_verify_screen.dart';
import '../../features/plans/presentation/screens/plans_screen.dart';
import '../../features/plans/presentation/screens/plan_detail_screen.dart';
import '../../features/plans/presentation/screens/create_plan_screen.dart';
import '../../features/live/presentation/screens/live_screen.dart';
import '../../features/around_me/presentation/screens/around_me_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../shell/main_shell.dart';

// ─────────────────────────────────────────────
// Route name constants — use these everywhere,
// never hardcode path strings
// ─────────────────────────────────────────────
class AppRoutes {
  AppRoutes._();

  static const String splash      = '/';
  static const String onboarding  = '/onboarding';
  static const String phoneEntry  = '/phone';
  static const String otpVerify   = '/otp';

  // Shell (bottom nav) tabs
  static const String plans       = '/plans';
  static const String planDetail  = '/plans/:id';
  static const String createPlan  = '/plans/create';
  static const String live        = '/live';
  static const String aroundMe    = '/around';
  static const String profile     = '/profile';
}

// ─────────────────────────────────────────────
// Router provider — Riverpod managed so it can
// react to auth state changes
// ─────────────────────────────────────────────
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: kDebugMode,
    routes: [

      // ── Auth flow ──────────────────────────
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.phoneEntry,
        builder: (_, __) => const PhoneEntryScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpVerify,
        builder: (context, state) {
          final phone = state.extra as String? ?? '';
          return OtpVerifyScreen(phone: phone);
        },
      ),

      // ── Main shell with bottom nav ─────────
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.plans,
            builder: (_, __) => const PlansScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (_, __) => const CreatePlanScreen(),
              ),
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return PlanDetailScreen(planId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.live,
            builder: (_, __) => const LiveScreen(),
          ),
          GoRoute(
            path: AppRoutes.aroundMe,
            builder: (_, __) => const AroundMeScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),
    ],

    // ── Redirect logic based on auth state ──
    redirect: (context, state) {
      // TODO: wire to auth provider
      // final isAuthed = ref.read(authStateProvider).isAuthenticated;
      // final isOnboarded = ref.read(authStateProvider).isOnboarded;
      return null; // no redirect for now
    },

    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
});
