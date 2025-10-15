import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onTap;
  const PrimaryButton({super.key, required this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 327.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child:Center(
          child: Text(
            title,
            style:theme.bodyMedium!.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
