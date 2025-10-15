import 'package:flutter/material.dart';

import '../../../../core/config/utils/app_colors.dart';

class HomeScreenButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function() onTap;

  const HomeScreenButton({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.secondaryAquaBreeze,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(iconData, color: AppColors.blackSecondary),
                ),
              ),
              SizedBox(width: 10),
              Text(title, style: theme.titleMedium!.copyWith(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
