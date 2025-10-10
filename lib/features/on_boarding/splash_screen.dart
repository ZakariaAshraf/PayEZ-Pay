import 'package:flutter/material.dart';
import 'package:payez_pay/features/authenticate/presentation/pages/sign_in.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
            (route) => false,
      );
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Image.asset("assets/icons/logo.png",width: 200,height: 200,)),
      ),
    );
  }
}
