import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

// ─────────────────────────────────────────────
// Main shell — persisted bottom nav + FAB
// Wraps all 4 main tabs
// ─────────────────────────────────────────────
class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutes.plans))    return 0;
    if (location.startsWith(AppRoutes.live))     return 1;
    if (location.startsWith(AppRoutes.aroundMe)) return 2;
    if (location.startsWith(AppRoutes.profile))  return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final idx = _currentIndex(context);

    return Scaffold(
      body: child,

      // ── FAB (Create Plan / Live Request / Discovery) ──
      floatingActionButton: idx == 3 ? null : FloatingActionButton(
        onPressed: () {
          switch (idx) {
            case 0: context.push(AppRoutes.createPlan);  break;
            case 1: context.push('/live/create');         break;
            case 2: context.push('/around/create');       break;
          }
        },
        backgroundColor: idx == 1 ? AppColors.red
                       : idx == 2 ? AppColors.green
                       : AppColors.primary,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white, size: 26),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ── Bottom Navigation ──────────────────
      bottomNavigationBar: _NearoBottomNav(currentIndex: idx),
    );
  }
}

class _NearoBottomNav extends StatelessWidget {
  final int currentIndex;
  const _NearoBottomNav({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bg,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              _NavItem(
                icon: Icons.calendar_today_outlined,
                activeIcon: Icons.calendar_today,
                label: 'Plans',
                active: currentIndex == 0,
                onTap: () => context.go(AppRoutes.plans),
              ),
              _NavItem(
                icon: Icons.play_circle_outline,
                activeIcon: Icons.play_circle,
                label: 'Live',
                active: currentIndex == 1,
                showDot: true,
                onTap: () => context.go(AppRoutes.live),
              ),
              // Centre space for FAB
              const Expanded(child: SizedBox()),
              _NavItem(
                icon: Icons.location_on_outlined,
                activeIcon: Icons.location_on,
                label: 'Around',
                active: currentIndex == 2,
                onTap: () => context.go(AppRoutes.aroundMe),
              ),
              _NavItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
                active: currentIndex == 3,
                onTap: () => context.go(AppRoutes.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool active;
  final bool showDot;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.active,
    required this.onTap,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  active ? activeIcon : icon,
                  size: 23,
                  color: active ? AppColors.primary : AppColors.text3,
                ),
                if (showDot && !active)
                  Positioned(
                    top: -2, right: -4,
                    child: Container(
                      width: 7, height: 7,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: AppTypography.tag.copyWith(
                color: active ? AppColors.primary : AppColors.text3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
