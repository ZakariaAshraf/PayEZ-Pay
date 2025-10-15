import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payez_pay/l10n/app_localizations.dart';

import '../../../../config/utils/app_colors.dart';
import '../../../../widgets/primary_button.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(l10n!.pleaseWriteEmail),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: l10n.email,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
              ),
            ),
            PrimaryButton(
              color: AppColors.secondaryAquaBreeze,
              title: l10n.changePassword,
             onTap: () async {
               try {
                 await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                 setState(() {});
               } catch (e) {
                 if (kDebugMode) {
                   print(e.toString());
                 }
               }
             },
            ),
          ],
        ),
      ),
    );
  }
}
