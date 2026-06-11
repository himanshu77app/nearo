import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_typography.dart';

// ─────────────────────────────────────────────
// Material 3 theme — wired to Nearo design tokens
// ─────────────────────────────────────────────
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    const colorScheme = ColorScheme(
      brightness:       Brightness.light,
      primary:          AppColors.primary,
      onPrimary:        Colors.white,
      primaryContainer: AppColors.primarySurface,
      onPrimaryContainer: AppColors.primaryDark,
      secondary:        AppColors.green,
      onSecondary:      Colors.white,
      error:            AppColors.red,
      onError:          Colors.white,
      surface:          AppColors.bg,
      onSurface:        AppColors.text1,
    );

    return ThemeData(
      useMaterial3:    true,
      colorScheme:     colorScheme,
      textTheme:       GoogleFonts.interTextTheme(),
      scaffoldBackgroundColor: AppColors.bgSoft,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor:    AppColors.bg,
        foregroundColor:    AppColors.text1,
        elevation:          0,
        scrolledUnderElevation: 0,
        surfaceTintColor:   Colors.transparent,
        titleTextStyle:     AppTypography.h2,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: const IconThemeData(color: AppColors.text1),
      ),

      // Bottom Navigation
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:      AppColors.bg,
        indicatorColor:       AppColors.primarySurface,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.caption.copyWith(color: AppColors.primary);
          }
          return AppTypography.caption;
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary);
          }
          return const IconThemeData(color: AppColors.text3);
        }),
        height:              68,
        elevation:           0,
        shadowColor:         Colors.transparent,
        surfaceTintColor:    Colors.transparent,
      ),

      // Cards
      cardTheme: CardThemeData(
        color:        AppColors.bg,
        elevation:    0,
        shape:        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border),
        ),
        margin: const EdgeInsets.all(0),
      ),

      // Input fields
      inputDecorationTheme: InputDecorationTheme(
        filled:             true,
        fillColor:          AppColors.bgSoft,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        hintStyle:          AppTypography.body2.copyWith(color: AppColors.text3),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // Filled buttons
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor:   AppColors.primary,
          foregroundColor:   Colors.white,
          textStyle:         AppTypography.button,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          minimumSize: const Size(double.infinity, 52),
          elevation:         0,
        ),
      ),

      // Outlined buttons
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.text2,
          textStyle:       AppTypography.label1,
          side:            const BorderSide(color: AppColors.border2, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          minimumSize: const Size(double.infinity, 52),
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: AppColors.border, thickness: 1, space: 0,
      ),

      // Chips
      chipTheme: ChipThemeData(
        backgroundColor:     AppColors.bgSoft,
        labelStyle:          AppTypography.label2,
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }
}
