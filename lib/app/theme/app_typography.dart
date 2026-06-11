import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

// ─────────────────────────────────────────────
// Text styles — Inter via google_fonts
// ─────────────────────────────────────────────
class AppTypography {
  AppTypography._();

  static TextStyle get logo => GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w900, color: AppColors.text1, letterSpacing: -1.0);
  static TextStyle get h1   => GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.text1, letterSpacing: -0.5);
  static TextStyle get h2   => GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.text1, letterSpacing: -0.3);
  static TextStyle get h3   => GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.text1, letterSpacing: -0.2);
  static TextStyle get body1   => GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.text1, height: 1.5);
  static TextStyle get body2   => GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.text2, height: 1.5);
  static TextStyle get label1  => GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.text1);
  static TextStyle get label2  => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.text2);
  static TextStyle get caption => GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.text3, letterSpacing: 0.2);
  static TextStyle get tag     => GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.5);
  static TextStyle get button  => GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: -0.2);
}
