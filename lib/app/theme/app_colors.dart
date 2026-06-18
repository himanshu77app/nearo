import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// Design tokens — matched 1:1 with the HTML prototype
// ─────────────────────────────────────────────
class AppColors {
  AppColors._();

  // Brand
  static const Color primary        = Color(0xFFFF5C35);
  static const Color primaryDark    = Color(0xFFE04520);
  static const Color primarySurface = Color(0xFFFFF0EC);

  // Backgrounds
  static const Color bg             = Color(0xFFFFFFFF);
  static const Color bgSoft         = Color(0xFFF7F8FA);
  static const Color bg2            = Color(0xFFF0F2F5);

  // Text
  static const Color text1          = Color(0xFF111318);
  static const Color text2          = Color(0xFF5A5F6E);
  static const Color text3          = Color(0xFFA3A8B5);

  // Semantic — green (Ready / Completed)
  static const Color green          = Color(0xFF16A34A);
  static const Color greenSurface   = Color(0xFFDCFCE7);

  // Semantic — amber (warnings, organiser trust)
  static const Color amber          = Color(0xFFD97706);
  static const Color amberSurface   = Color(0xFFFEF3C7);

  // Semantic — blue (verified badge)
  static const Color blue           = Color(0xFF2563EB);
  static const Color blueSurface    = Color(0xFFDBEAFE);

  // Semantic — red (Live tab, urgent, expired)
  static const Color red            = Color(0xFFDC2626);
  static const Color redSurface     = Color(0xFFFEE2E2);

  // Semantic — purple (discoveries)
  static const Color purple         = Color(0xFF7C3AED);
  static const Color purpleSurface  = Color(0xFFEDE9FE);

  // Borders
  static const Color border         = Color(0xFFE5E7EB);
  static const Color border2        = Color(0xFFD1D5DB);

  // Pastel palette (welcome screens)
  static const Color pastelCoral    = Color(0xFFFFB5A0);
  static const Color pastelMint     = Color(0xFFB5EAD7);
  static const Color pastelSky      = Color(0xFFAED6F1);
  static const Color pastelLavender = Color(0xFFC3B1E1);
  static const Color pastelLemon    = Color(0xFFFFF3B0);
  static const Color pastelBlush    = Color(0xFFFADADD);
}
