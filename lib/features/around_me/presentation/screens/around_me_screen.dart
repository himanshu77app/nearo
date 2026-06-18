import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

// ─────────────────────────────────────────────
// Tab 3 — Around Me (local discovery feed)
// Concerts, food fests, pop-ups near the user
// ─────────────────────────────────────────────
class AroundMeScreen extends StatelessWidget {
  const AroundMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSoft,
      body: Column(children: [
        _AroundMeHeader(),
        Expanded(child: _AroundMeBody()),
      ]),
    );
  }
}

class _AroundMeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text('Around Me', style: AppTypography.h1),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.bgSoft,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.location_on_outlined, size: 14, color: AppColors.green),
                  const SizedBox(width: 4),
                  Text('Whitefield', style: AppTypography.label2.copyWith(color: AppColors.green, fontWeight: FontWeight.w700)),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: AppColors.text3),
                ]),
              ),
            ]),
            const SizedBox(height: 4),
            Text('What\'s happening near you today', style: AppTypography.body2),
            const Divider(height: 20),
          ]),
        ),
      ),
    );
  }
}

class _AroundMeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('🎪', style: TextStyle(fontSize: 48)),
        const SizedBox(height: 12),
        Text('Discovering nearby events…', style: AppTypography.h3),
        const SizedBox(height: 6),
        Text('Location-based discovery comes next', style: AppTypography.body2),
      ]),
    );
  }
}
