import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String phone;
  const OtpVerifyScreen({super.key, required this.phone});
  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final List<TextEditingController> _ctrls = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _nodes = List.generate(6, (_) => FocusNode());
  bool _loading = false;

  String get _otp => _ctrls.map((c) => c.text).join();
  bool get _complete => _otp.length == 6;

  @override
  void dispose() {
    for (final c in _ctrls) c.dispose();
    for (final n in _nodes) n.dispose();
    super.dispose();
  }

  void _onChanged(int idx, String val) {
    if (val.length == 1 && idx < 5) _nodes[idx + 1].requestFocus();
    if (val.isEmpty && idx > 0)      _nodes[idx - 1].requestFocus();
    setState(() {});
    if (_complete) _verify();
  }

  Future<void> _verify() async {
    setState(() => _loading = true);
    // TODO: call Supabase OTP verify
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) context.go(AppRoutes.plans);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Phone')),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Enter the 6-digit code sent to', style: AppTypography.body2),
          const SizedBox(height: 4),
          Text(widget.phone, style: AppTypography.h3),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (i) => SizedBox(
              width: 48, height: 56,
              child: TextField(
                controller: _ctrls[i],
                focusNode: _nodes[i],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (v) => _onChanged(i, v),
                style: AppTypography.h2,
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
              ),
            )),
          ),
          const SizedBox(height: 32),
          if (_loading)
            const Center(child: CircularProgressIndicator())
          else
            FilledButton(
              onPressed: _complete ? _verify : null,
              child: const Text('Verify →'),
            ),
          const SizedBox(height: 16),
          Center(child: TextButton(
            onPressed: () {},
            child: const Text('Resend code'),
          )),
        ]),
      ),
    );
  }
}
