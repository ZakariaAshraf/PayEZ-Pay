import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/config/utils/app_colors.dart';

class ReferSection extends StatelessWidget {
  const ReferSection({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 200.h,
        width: 400.w,
        decoration: BoxDecoration(
          color: AppColors.primaryDeepOceanBlue,
          border: Border.all(strokeAlign: 0.5),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              left: 170,
              top: 4,
              child: Image(
                image: AssetImage("assets/images/refer.png"),
                width: 170,
                height: 170,
              ),
            ),

            Positioned(
              top: 20,
              left: 10,
              child: SizedBox(
                width: 200,
                child: Text(
                  "Invite a friend and both earn cashback",
                  style: theme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 5,
              child: TextButton(
                onPressed: (){},
                child: Text(
                  "Invite friend -->",
                  style: theme.bodyMedium!.copyWith(
                    color: AppColors.secondaryAquaBreeze,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
