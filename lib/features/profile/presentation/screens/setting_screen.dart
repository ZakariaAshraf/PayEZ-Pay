import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/profile_button.dart';
import 'change_password_screen.dart';
import 'edit_profile_screen.dart';

class SettingScreen extends StatefulWidget {
  final String name;
  final String phone;
 final String? photoUrl;

  const SettingScreen({
    super.key,
    required this.name,
    required this.phone,
    this.photoUrl,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          // ListTile(
          //   leading: const Icon(
          //     Icons.account_circle_outlined,
          //   ),
          //   title: Text(
          //       "Account Settings",
          //       style: Theme.of(context)
          //           .textTheme
          //           .titleMedium!
          //   ),
          // ),

          // ListTile(
          //   leading: const Icon(
          //     Icons.account_circle_outlined,
          //   ),
          //   title: Text(
          //       "Account Information",
          //       style: Theme.of(context)
          //           .textTheme
          //           .titleMedium!
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              _buildInfoTile(Icons.person_outline, widget.name),
              _buildInfoTile(Icons.phone_outlined, widget.phone),
              _buildInfoTile(
                Icons.email_outlined,
                FirebaseAuth.instance.currentUser?.email ?? "no email",
              ),
              SizedBox(height: 24.h),

            ],
          ),

          // Card(
          //   elevation: 0.5,
          //   child: ListTile(
          //     trailing: Switch(
          //       inactiveTrackColor: AppColors.primary,
          //       activeColor: AppColors.primary,
          //       value: themeProvider.themeMode == ThemeMode.dark,
          //       onChanged: (value) {
          //         themeProvider.toggleTheme(value);
          //       },
          //     ),
          //     title: Text(
          //       "Change Theme",
          //       style: Theme.of(context)
          //           .textTheme
          //           .titleMedium!,
          //     ),
          //   ),
          // ),
          ProfileButton(
            title: "Change Password",
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen(),
                ),
              );
            },
            iconData: Icons.lock_open_outlined,
          ),
          ProfileButton(
            title: "Edit Profile",
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
            iconData: Icons.person,
          ),
          ProfileButton(
            title: "logout",
            function: () async {
              try {
                await FirebaseAuth.instance.signOut();
                if (kDebugMode) {
                  print("user signed out");
                }
              } catch (e) {
                if (kDebugMode) {
                  print(e.toString());
                }
              }
            },
            iconData: Icons.logout,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Icon(icon, size: 24),
        ],
      ),
    );
  }
}
