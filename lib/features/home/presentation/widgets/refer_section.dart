import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/l10n/app_localizations.dart';

import '../../../../core/config/utils/app_colors.dart';

class ReferSection extends StatelessWidget {
  const ReferSection({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    final direction = Directionality.of(context);

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
          children: [
            Positioned.directional(
              textDirection: direction,
              end: 10.w,
              top: 4,
              child: Image(
                image: const AssetImage("assets/images/refer.png"),
                width: 170.w,
                height: 170.h,
              ),
            ),

            Positioned.directional(
              textDirection: direction,
              start: 10.w,
              top: 20,
              child: SizedBox(
                width: 200.w,
                child: Text(
                  l10n!.inviteFriendEarnCashback,
                  style: theme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned.directional(
              textDirection: direction,
              start: 5.w,
              top: 100,
              child: TextButton(
                onPressed: () {},
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
