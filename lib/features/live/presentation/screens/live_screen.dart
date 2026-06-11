import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

// ─────────────────────────────────────────────
// Tab 2 — Live requests (urgent, time-boxed)
// Red accent, countdown timers
// ─────────────────────────────────────────────
class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSoft,
      body: Column(children: [
        _LiveHeader(),
        Expanded(child: _LiveBody()),
      ]),
    );
  }
}

class _LiveHeader extends StatelessWidget {
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
              Text('Live', style: AppTypography.h1),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.red.withOpacity(.12),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: 7, height: 7, decoration: BoxDecoration(color: AppColors.red, borderRadius: BorderRadius.circular(99))),
                  const SizedBox(width: 5),
                  Text('Now', style: AppTypography.tag.copyWith(color: AppColors.red)),
                ]),
              ),
            ]),
            const SizedBox(height: 4),
            Text('Urgent requests · fills in minutes', style: AppTypography.body2),
            const Divider(height: 20),
          ]),
        ),
      ),
    );
  }
}

class _LiveBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('🚕', style: TextStyle(fontSize: 48)),
        const SizedBox(height: 12),
        Text('No live requests right now', style: AppTypography.h3),
        const SizedBox(height: 6),
        Text('Check back in a bit — things move fast here', style: AppTypography.body2),
      ]),
    );
  }
}
