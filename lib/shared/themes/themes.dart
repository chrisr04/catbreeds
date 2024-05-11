import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'colors/colors.dart';
part 'typography/typography.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.deepOrange,
  fontFamily: AppTypography.poppins,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.deepOrange,
    onPrimary: AppColors.white,
    secondary: AppColors.oceanBlue,
    onSecondary: AppColors.white,
    error: AppColors.imperialRed,
    onError: AppColors.white,
    background: AppColors.white,
    onBackground: AppColors.black,
    surface: AppColors.white,
    onSurface: AppColors.black,
    tertiary: AppColors.camel,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppTypography.heading1,
      color: AppColors.black,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppTypography.heading2,
      color: AppColors.black,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppTypography.heading3,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppTypography.heading4,
      color: AppColors.black,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppTypography.heading5,
      color: AppColors.black,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: AppTypography.heading6,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppTypography.large,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppTypography.medium,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppTypography.small,
      color: AppColors.black,
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.black.withOpacity(0.1),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);
