import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/config/utils/app_colors.dart';
import 'package:payez_pay/l10n/app_localizations.dart';

class ReferSection extends StatelessWidget {
  const ReferSection({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
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
                  l10n!.inviteFriendEarnCashback,
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
                  l10n.inviteFriend,
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
