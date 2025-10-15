import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payez_pay/features/authenticate/presentation/pages/sign_up.dart';
import 'package:payez_pay/features/home/presentation/screens/home_screen.dart';
import 'package:payez_pay/l10n/app_localizations.dart';
import '../../../../core/config/utils/app_colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../manager/auth_cubit.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(l10n!.loginFailed)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                // Container(
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(
                //         "assets/images/food.jpg",
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 130,
                        width: 138,
                        child: Image.asset(
                          "assets/icons/logo.png",
                          width: 134,
                          height: 134,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        controller: emailController,
                        hintText: l10n!.email,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        isPassword: true,
                        controller: passwordController,
                        hintText: l10n.password,
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: emailController.text,
                            );
                          } catch (e) {
                            if (kDebugMode) {
                              print(e.toString());
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            l10n.forgetPassword,
                            style: TextStyle(color: AppColors.blackSecondary),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      //sign in button
                      Center(
                        child: CustomButton(
                          title: l10n.login,
                          onTap: () {
                            context.read<AuthCubit>().signIn(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            l10n.dontHaveAccount,
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ),
                                (route) => true,
                              );
                            },
                            child: Text(
                              l10n.create,
                              style: TextStyle(color: Color(0xff1F4C6B)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
