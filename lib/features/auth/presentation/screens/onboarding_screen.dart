import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/storage/secure_storage.dart';

// ─────────────────────────────────────────────
// 3-slide onboarding carousel
// Plans / Live / Around Me teaser
// ─────────────────────────────────────────────
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  static const _slides = [
    _Slide(emoji: '🏔', color1: Color(0xFFD4F5E9), color2: Color(0xFFB5EAD7),
      tag: 'Plans', tagColor: AppColors.green,
      title: 'Post a plan.\nFind your ', titleHighlight: 'people.',
      desc: 'Going somewhere but need a few more? Post a plan, set how many spots, and let nearby people join.'),
    _Slide(emoji: '🚕', color1: Color(0xFFEDE3FF), color2: Color(0xFFC3B1E1),
      tag: 'Live', tagColor: AppColors.purple,
      title: 'Need someone\n', titleHighlight: 'right now?',
      desc: 'Cab leaving in 10 mins. Match needs a player. Post a live request and fill the spot in minutes.'),
    _Slide(emoji: '🎪', color1: Color(0xFFFFFDE7), color2: Color(0xFFFFF3B0),
      tag: 'Around Me', tagColor: AppColors.amber,
      title: 'Discover what\'s\nhappening ', titleHighlight: 'near you.',
      desc: 'Concerts, food festivals, quizzes, deals. See what\'s around and turn it into a plan with one tap.'),
  ];

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  Future<void> _finish() async {
    await SecureStorageService.setOnboarded();
    if (mounted) context.go(AppRoutes.phoneEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (_, i) => _SlideWidget(slide: _slides[i]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
              child: Row(
                children: [
                  // dots
                  Row(children: List.generate(_slides.length, (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width:  i == _page ? 22 : 7,
                    height: 7,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: i == _page ? AppColors.primary : AppColors.border,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ))),
                  const Spacer(),
                  // next / get started
                  FilledButton(
                    onPressed: () {
                      if (_page < _slides.length - 1) {
                        _controller.nextPage(duration: const Duration(milliseconds: 320), curve: Curves.easeInOut);
                      } else {
                        _finish();
                      }
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: Size.zero, padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                    ),
                    child: Text(_page == _slides.length - 1 ? 'Get Started' : 'Next  →'),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: _finish,
              child: Text('Skip', style: AppTypography.label2.copyWith(color: AppColors.text3)),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _Slide {
  final String emoji, tag, title, titleHighlight, desc;
  final Color color1, color2, tagColor;
  const _Slide({required this.emoji, required this.color1, required this.color2,
    required this.tag, required this.tagColor, required this.title,
    required this.titleHighlight, required this.desc});
}

class _SlideWidget extends StatelessWidget {
  final _Slide slide;
  const _SlideWidget({required this.slide});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 32, 36, 16),
      child: Column(
        children: [
          Container(
            width: 210, height: 210,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [slide.color1, slide.color2], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(36),
            ),
            child: Center(child: Text(slide.emoji, style: const TextStyle(fontSize: 80))),
          ),
          const SizedBox(height: 32),
          Text(slide.tag.toUpperCase(), style: AppTypography.tag.copyWith(color: slide.tagColor, letterSpacing: 1.5)),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTypography.h1.copyWith(height: 1.25),
              children: [
                TextSpan(text: slide.title),
                TextSpan(text: slide.titleHighlight, style: const TextStyle(color: AppColors.primary)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(slide.desc, textAlign: TextAlign.center, style: AppTypography.body2),
        ],
      ),
    );
  }
}
