import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/config/themes/app_theme.dart';
import 'package:payez_pay/features/add_money/presentation/cubit/add_funds_cubit.dart';
import 'package:payez_pay/features/home/presentation/screens/home_screen.dart';
import 'package:payez_pay/features/on_boarding/splash_screen.dart';
import 'features/authenticate/data/repositories/auth_repository_impl.dart';
import 'features/authenticate/domain/use_cases/auth_usecases.dart';
import 'features/authenticate/presentation/manager/auth_cubit.dart';
import 'features/authenticate/presentation/pages/sign_in.dart';
import 'features/authenticate/presentation/pages/sign_up.dart';
import 'features/profile/presentation/Cubit/user_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            signInUseCase: SignInUseCase(FirebaseAuthRepository()),
            registerUseCase: RegisterUseCase(FirebaseAuthRepository()),
          ),

        ),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => AddFundsCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'PayEz Pay',
          theme: AppTheme.getApplicationLightTheme(),
          darkTheme: AppTheme.getApplicationDarkTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: "/wrapper",
          routes: {
            "/": (context) => SplashScreen(),
            "/signIn": (context) => const SignIn(),
            "/signUp": (context) => const SignUp(),
            "/wrapper": (context) => const AuthWrapper(),
            "/home": (context) => HomeScreen(),
          },
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return SignIn();
        }
      },
    );
  }
}