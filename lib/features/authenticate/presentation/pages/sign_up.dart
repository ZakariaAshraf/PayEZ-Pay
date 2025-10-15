import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payez_pay/features/authenticate/presentation/pages/sign_in.dart';
import 'package:payez_pay/features/home/presentation/screens/home_screen.dart';
import 'package:payez_pay/l10n/app_localizations.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../manager/auth_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n!.registerFailed)),
          );
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Stack(
            children: [
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
                    CustomTextField(
                        controller: nameController, hintText: l10n!.fullName),
                    const SizedBox(height: 15),
                    CustomTextField(
                        controller: emailController, hintText: l10n.email),
                    const SizedBox(height: 15),
                    CustomTextField(isPassword: true,
                        controller: passwordController, hintText: l10n.password),
                    const SizedBox(height: 15),
                    CustomTextField(
                        controller: phoneController, hintText: l10n.phoneNumber),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: CustomButton(
                        title: l10n.register,
                        onTap: () {
                          context.read<AuthCubit>().register(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                name: nameController.text,
                              );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(l10n.alreadyHaveAccount,
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                ),(route) => true,);
                          },
                          child: Text(
                            l10n.login,
                            style: TextStyle(
                              color: Color(
                                0xff1F4C6B,
                              ),
                            ),
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
      }),
    );
  }
}
