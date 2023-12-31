import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy/core/utils/common_features/OTP/presentation/views/OTP_view.dart';
import 'package:shopy/core/utils/common_features/success/presentation/view_models/success_view.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:shopy/features/signIn/presentation/views/signIn_view.dart';
import 'package:shopy/features/signUp/presentation/views/signUp_view.dart';

import '../../features/bottom_navigation_bar/presentation/Views/bottom_navigation_bar_view.dart';
import '../../features/home/presentation/views/details_view.dart';
import '../../features/intro/presentation/views/intro_view.dart';
import '../../features/signIn/presentation/views/enter_forgotten_email.dart';

abstract class AppRouter {
  static const signUpRoute = '/signUp';
  static const signInRoute = '/signIn';
  static const homeRoute = '/homeView';
  static const OTPRoute = '/OTPView';
  static const successRoute = '/successView';
  static const forgotPasswordRoute = '/fprgotPass';
  static const detailsRoute = '/details';

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
        builder: (context, state) =>
            BottomNavigationBarView(email: state.extra as String),
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
        path: detailsRoute,
        builder: (context, state) =>
            DetailsView(productModel: state.extra as ProductModel),
      ),
      GoRoute(
        path: forgotPasswordRoute,
        builder: (context, state) => const EnterForgottenEmail(),
      ),
    ],
  );
}
