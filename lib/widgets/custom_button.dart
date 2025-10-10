import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final Color? color;
  const CustomButton({super.key, required this.title, required this.onTap,this.color});

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 55.h,
        width: 250.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackSecondary),
          borderRadius: BorderRadius.circular(10),
          color: color ?? AppColors.secondaryAquaBreeze
        ),
        child:  Center(
          child: Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(color: AppColors.blackSecondary),
          ),
        ),
      ),
    );
  }
}
