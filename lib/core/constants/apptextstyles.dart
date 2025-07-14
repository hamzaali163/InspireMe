import 'package:flutter/material.dart';
import 'package:inspire_me/core/constants/appcolors.dart';

class AppTextStyles {
  // Headings
  static TextStyle heading(BuildContext context) {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
    );
  }

  // Subheading
  static TextStyle subheading(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: Theme.of(context).brightness == Brightness.dark ? AppColors.lightbrown : AppColors.lightText,
    );
  }

  // Input Labels
  static TextStyle label(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
    );
  }

  // Input Field Text
  static TextStyle input(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: Theme.of(context).brightness == Brightness.dark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
    );
  }

  // Button Text
  static const TextStyle button = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  // Link Text (e.g., "Sign Up")
  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.accent,
    decoration: TextDecoration.underline,
  );
}
