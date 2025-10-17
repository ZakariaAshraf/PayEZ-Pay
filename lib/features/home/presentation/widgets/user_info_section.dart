import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/l10n/app_localizations.dart';
import '../../../../data/app_user_model.dart';
import '../../../settings/presentation/screens/setting_screen.dart';

class UserInfoSection extends StatefulWidget {
  final AppUserModel user;
  final bool isHide;

  const UserInfoSection({super.key, required this.user, this.isHide = false});

  @override
  State<UserInfoSection> createState() => _UserInfoSectionState();
}

class _UserInfoSectionState extends State<UserInfoSection> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isHide;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          ListTile(
            leading:  IconButton(icon: Icon(CupertinoIcons.profile_circled), onPressed: () {},),
            subtitle: Text(
              l10n!.goodMorning,
              style: theme.bodySmall!.copyWith(color: Colors.grey),
            ),
            title: Text(l10n.hi(widget.user.name), style: theme.titleMedium),
            trailing: IconButton(icon: Icon(Icons.settings_outlined), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingScreen(
                    name: widget.user.name,
                    phone: widget.user.phone,
                  ),
                ),
              );
            },),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      l10n.totalBalance,
                      style: theme.bodyMedium!.copyWith(color: Colors.grey),
                    ),
                    SizedBox(width: 4.w),
                    IconButton(
                      iconSize: 30.r,
                      icon: Icon(
                        _obscure
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  _obscure ? "\$ ••••••" : "\$ ${widget.user.balance}",
                  style: theme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 50.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}