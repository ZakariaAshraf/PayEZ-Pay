import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:payez_pay/main.dart';
import '../../../../core/config/locale/widgets/language_toggle_button.dart';
import '../../../../core/config/themes/widgets/theme_toggle_button.dart';
import '../components/settings_button.dart';
import 'change_password_screen.dart';
import 'edit_profile_screen.dart';
import 'package:payez_pay/l10n/app_localizations.dart';

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
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n!.settings, style: theme.titleLarge),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          ProfileButton(
            title: l10n.changePassword,
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
            title: l10n.editProfile,
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
          ThemeToggleButton(),
          LanguageToggleButton(),
          ProfileButton(
            title: l10n.logout,
            function: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const AuthWrapper()),
                  (Route<dynamic> route) => false,
                );
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
}
