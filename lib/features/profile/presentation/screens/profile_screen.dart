import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

// ─────────────────────────────────────────────
// Tab 4 — Profile + Reliability Score
// ─────────────────────────────────────────────
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSoft,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            _ProfileHeader(),
            const SizedBox(height: 12),
            _ReliabilityCard(),
            const SizedBox(height: 12),
            _StatsRow(),
            const SizedBox(height: 12),
            _SettingsSection(),
          ]),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Row(children: [
        Container(
          width: 64, height: 64,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFFFFE8F0), Color(0xFFEDE3FF)]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(child: Text('👤', style: TextStyle(fontSize: 28))),
        ),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Your Profile', style: AppTypography.h2),
          const SizedBox(height: 2),
          Text('Whitefield · Bangalore', style: AppTypography.body2),
        ])),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            minimumSize: Size.zero,
          ),
          child: const Text('Edit'),
        ),
      ]),
    );
  }
}

class _ReliabilityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF5C35), Color(0xFFFF8C69)],
          begin: Alignment.topLeft, end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Reliability Score', style: AppTypography.label1.copyWith(color: Colors.white70)),
          const SizedBox(height: 4),
          Text('–', style: AppTypography.h1.copyWith(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text('Join 3+ plans to unlock', style: AppTypography.caption.copyWith(color: Colors.white70)),
        ]),
        const Spacer(),
        const Text('⭐', style: TextStyle(fontSize: 52)),
      ]),
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          _Stat(value: '0', label: 'Plans created'),
          _divider(),
          _Stat(value: '0', label: 'Plans joined'),
          _divider(),
          _Stat(value: '0', label: 'Activities done'),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 36, color: AppColors.border);
}

class _Stat extends StatelessWidget {
  final String value, label;
  const _Stat({required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(children: [
      Text(value, style: AppTypography.h2),
      const SizedBox(height: 2),
      Text(label, style: AppTypography.caption.copyWith(color: AppColors.text3), textAlign: TextAlign.center),
    ]));
  }
}

class _SettingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      ('🔔', 'Notifications'),
      ('🔒', 'Privacy Settings'),
      ('📍', 'Default Location'),
      ('❓', 'Help & Feedback'),
      ('🚪', 'Sign Out'),
    ];
    return Container(
      color: AppColors.bg,
      child: Column(
        children: items.map((e) => ListTile(
          leading: Text(e.$1, style: const TextStyle(fontSize: 20)),
          title: Text(e.$2, style: AppTypography.body1),
          trailing: const Icon(Icons.chevron_right, color: AppColors.text3),
          onTap: () {},
        )).toList(),
      ),
    );
  }
}
