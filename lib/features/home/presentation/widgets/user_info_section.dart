import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/data/user_model.dart';

class UserInfoSection extends StatefulWidget {
  final UserModel user;
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(CupertinoIcons.profile_circled),
            subtitle: Text(
              "Good Morning!",
              style: theme.bodySmall!.copyWith(color: Colors.grey),
            ),
            title: Text("Hi, ${widget.user.name}", style: theme.titleMedium),
            trailing: const Icon(Icons.notifications_active_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Total balance",
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
                // The text now conditionally displays the balance or asterisks
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