import 'package:flutter/material.dart';
import 'package:payez_pay/config/utils/app_colors.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToastWidget {
  static void show({
    required BuildContext context,
    required String title,
    required String iconPath,
    Color? iconBackgroundColor,
    Color? backgroundColor,
    Duration? autoCloseDuration,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.simple,
      title: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: iconPath.toLowerCase().endsWith('.svg')
                  ? Image.asset(
                      iconPath,
                      width: 16.w,
                      height: 16.h,
                    )
                  : Image.asset(
                      iconPath,
                      width: 30.w,
                      height: 30.h,
                    ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor ?? (isDark ? const Color(0xFF2A2A2A) : const Color(0xFFFFEFE8)),
      margin: EdgeInsets.only(
        top: 650.h,
        left: 60.w,
        right: 60.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      borderRadius: BorderRadiusGeometry.all(Radius.circular(25.r)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10.r,
          offset: const Offset(0, 2),
        ),
      ],
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
    );
  }
}
