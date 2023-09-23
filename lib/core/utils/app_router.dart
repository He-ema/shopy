import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/common_features/OTP/presentation/views/OTP_view.dart';
import 'package:shopy/core/utils/common_features/success/presentation/view_models/success_view.dart';
import 'package:shopy/features/signIn/presentation/views/signIn_view.dart';
import 'package:shopy/features/signUp/presentation/views/signUp_view.dart';

import '../../features/home/presentation/Views/home_view.dart';
import '../../features/intro/presentation/views/intro_view.dart';
import '../../features/signIn/presentation/views/enter_forgotten_email.dart';

abstract class AppRouter {
  static const signUpRoute = '/signUp';
  static const signInRoute = '/signIn';
  static const homeRoute = '/homeView';
  static const OTPRoute = '/OTPView';
  static const successRoute = '/successView';
  static const forgotPasswordRoute = '/fprgotPass';

// GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const IntroView(),
      ),
      GoRoute(
        path: signUpRoute,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: signInRoute,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: homeRoute,
        builder: (context, state) => HomeView(email: state.extra as String),
      ),
      GoRoute(
        path: OTPRoute,
        builder: (context, state) => OTPView(email: state.extra as String),
      ),
      GoRoute(
        path: successRoute,
        builder: (context, state) => SuccessView(email: state.extra as String),
      ),
      GoRoute(
        path: forgotPasswordRoute,
        builder: (context, state) => const EnterForgottenEmail(),
      ),
    ],
  );
}
