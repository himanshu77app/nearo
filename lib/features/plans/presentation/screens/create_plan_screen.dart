import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

// ─────────────────────────────────────────────
// Create Plan — 4-step wizard (stub)
// Steps: category → details → slots+time → preview
// ─────────────────────────────────────────────
class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({super.key});
  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  int _step = 0;
  static const _steps = ['Category', 'Details', 'Slots & Time', 'Preview'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: Text('New Plan · Step ${_step + 1} of ${_steps.length}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: (_step + 1) / _steps.length,
            backgroundColor: AppColors.border,
            color: AppColors.primary,
          ),
        ),
      ),
      body: _StepBody(step: _step),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: Row(children: [
            if (_step > 0)
              OutlinedButton(
                onPressed: () => setState(() => _step--),
                child: const Text('Back'),
              ),
            if (_step > 0) const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  if (_step < _steps.length - 1) {
                    setState(() => _step++);
                  } else {
                    context.pop(); // TODO: submit plan
                  }
                },
                child: Text(_step == _steps.length - 1 ? 'Create Plan 🚀' : 'Next  →'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _StepBody extends StatelessWidget {
  final int step;
  const _StepBody({required this.step});

  static const _emojis   = ['🎯', '📝', '⏰', '✅'];
  static const _titles   = ['Pick a category', 'Tell us more', 'Set slots & time', 'Looks good?'];
  static const _subtitles = [
    'What kind of activity is this?',
    'Give your plan a title and description.',
    'How many people do you need? When?',
    'Review your plan before posting.',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(_emojis[step], style: const TextStyle(fontSize: 56)),
          const SizedBox(height: 16),
          Text(_titles[step], style: AppTypography.h2, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(_subtitles[step], style: AppTypography.body2, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgSoft,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Text('Step ${step + 1} form fields will be built here', style: AppTypography.label1.copyWith(color: AppColors.text3)),
          ),
        ]),
      ),
    );
  }
}
