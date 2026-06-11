import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class PhoneEntryScreen extends StatefulWidget {
  const PhoneEntryScreen({super.key});
  @override
  State<PhoneEntryScreen> createState() => _PhoneEntryScreenState();
}

class _PhoneEntryScreenState extends State<PhoneEntryScreen> {
  final _ctrl = TextEditingController();
  bool get _valid => _ctrl.text.length == 10;

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Pastel header
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFE8F0), Color(0xFFEDE3FF)],
                begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.fromLTRB(36, MediaQuery.of(context).padding.top + 40, 36, 36),
            child: Column(children: [
              Container(
                width: 68, height: 68,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 14)],
                ),
                child: const Center(child: Text('📱', style: TextStyle(fontSize: 30))),
              ),
              const SizedBox(height: 18),
              Text("What's your number?", style: AppTypography.h1),
              const SizedBox(height: 6),
              Text("We'll send a one-time code.\nNo password. No email. Just you.",
                textAlign: TextAlign.center, style: AppTypography.body2),
            ]),
          ),

          // Form
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Phone Number', style: AppTypography.caption.copyWith(color: AppColors.primary, letterSpacing: .6)),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border, width: 1.5),
                  ),
                  child: Row(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text('🇮🇳 +91', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.text1)),
                    ),
                    Container(width: 1.5, height: 24, color: AppColors.border),
                    Expanded(
                      child: TextField(
                        controller: _ctrl,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: .5),
                        decoration: const InputDecoration(
                          border: InputBorder.none, counterText: '',
                          hintText: '98765 43210',
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('🔒', style: TextStyle(fontSize: 15)),
                    const SizedBox(width: 10),
                    Expanded(child: Text.rich(
                      TextSpan(children: [
                        const TextSpan(text: 'Your number stays private. ', style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(text: "It's never shown to other users.", style: AppTypography.label2),
                      ]),
                      style: AppTypography.label2,
                    )),
                  ]),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: _valid ? () => context.push(AppRoutes.otpVerify, extra: '+91${_ctrl.text}') : null,
                  child: const Text('Send Code →'),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => context.go(AppRoutes.plans),
                  child: const Text('Browse first, join later'),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
