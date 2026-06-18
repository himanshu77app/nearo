import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

// ─────────────────────────────────────────────
// Tab 1 — Plans feed
// Scaffold is ready; data wiring comes next sprint
// ─────────────────────────────────────────────
class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});
  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  final _searchCtrl = TextEditingController();
  String _activeFilter = 'All';
  final _filters = ['All', '🏃 Running', '🚴 Cycling', '🥾 Trek', '🎲 Games', '🍕 Food', '🎵 Concert'];

  @override
  void dispose() { _searchCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSoft,
      body: Column(children: [
        _Header(searchCtrl: _searchCtrl, filters: _filters,
          activeFilter: _activeFilter, onFilterTap: (f) => setState(() => _activeFilter = f)),
        Expanded(child: _Body()),
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  final TextEditingController searchCtrl;
  final List<String> filters;
  final String activeFilter;
  final ValueChanged<String> onFilterTap;
  const _Header({required this.searchCtrl, required this.filters,
    required this.activeFilter, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: SafeArea(
        bottom: false,
        child: Column(children: [
          // Top row
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
            child: Row(children: [
              RichText(text: const TextSpan(
                style: TextStyle(fontFamily: 'Inter', fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.text1, letterSpacing: -1),
                children: [TextSpan(text: 'near'), TextSpan(text: 'o', style: TextStyle(color: AppColors.primary))],
              )),
              const Spacer(),
              IconButton(icon: const Icon(Icons.notifications_outlined, color: AppColors.text2), onPressed: () {}),
            ]),
          ),
          // Search
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
            child: TextField(
              controller: searchCtrl,
              decoration: const InputDecoration(
                hintText: 'Search plans near you…',
                prefixIcon: Icon(Icons.search, color: AppColors.text3, size: 20),
              ),
            ),
          ),
          // Filter chips
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final active = filters[i] == activeFilter;
                return GestureDetector(
                  onTap: () => onFilterTap(filters[i]),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color:  active ? AppColors.primary : AppColors.bg,
                      border: Border.all(color: active ? AppColors.primary : AppColors.border, width: 1.5),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(filters[i], style: AppTypography.label2.copyWith(color: active ? Colors.white : AppColors.text2, fontWeight: FontWeight.w600)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
        ]),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('🏔', style: TextStyle(fontSize: 48)),
        const SizedBox(height: 12),
        Text('Plans load here', style: AppTypography.h3),
        const SizedBox(height: 6),
        Text('Wire Supabase in the next sprint', style: AppTypography.body2),
      ]),
    );
  }
}
