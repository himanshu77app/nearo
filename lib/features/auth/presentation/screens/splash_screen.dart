import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/storage/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    if (!mounted) return;
    bool onboarded = false;
    try {
      onboarded = await SecureStorageService.isOnboarded();
    } catch (_) {
      onboarded = false;
    }
    if (!mounted) return;
    if (onboarded) {
      context.go(AppRoutes.plans);
    } else {
      context.go(AppRoutes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFE8F0), Color(0xFFE8D5FF), Color(0xFFD5EEFF)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 90, height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 20, offset: const Offset(0, 8))],
                ),
                child: const Icon(Icons.location_on, color: AppColors.primary, size: 44),
              ),
              const SizedBox(height: 18),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 38, fontWeight: FontWeight.w900, letterSpacing: -1.5, color: Color(0xFF1A1A2E)),
                  children: [
                    TextSpan(text: 'near'),
                    TextSpan(text: 'o', style: TextStyle(color: AppColors.primary)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text('Find your people. Make it happen.', style: AppTypography.body2),
            ],
          ),
        ),
      ),
    );
  }
}
