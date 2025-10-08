import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.blackSecondary,
      ),
      titleLarge: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blackSecondary,

      ),
      // Page titles'
      bodyLarge: TextStyle(
        fontSize: 15.sp,
        color: AppColors.blackSecondary,
        fontWeight: FontWeight.w800
      ),
      // Paragraph text
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.blackSecondary,
      ),
      // List titles
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blackSecondary,
      ),
      // List item titles, Important text snippets
      bodySmall: TextStyle(
        fontSize: 10.sp,
        color: Colors.grey,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
        color: AppColors.blackSecondary,
      ),
      // Secondary text, Captions
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.blackSecondary,
      ), // Buttons, Tabs
    );
  static TextTheme darkTextTheme = TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whitePrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whitePrimary,
      ),

      // Page titles
      bodyLarge: TextStyle(
          fontSize: 15.sp,
          color: AppColors.whitePrimary),
      // Paragraph text
      titleMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whitePrimary,
      ),
      // List titles
      titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: AppColors.whitePrimary),
      // List item titles, Important text snippets
      bodySmall: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
        color:AppColors.whitePrimary,
        fontWeight: FontWeight.bold
      ),

      // Secondary text, Captions
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whitePrimary,
      ), // Buttons, Tabs
    );
}
