import 'package:go_router/go_router.dart';
import 'package:shopy/features/signIn/presentation/views/signIn_view.dart';
import 'package:shopy/features/signUp/presentation/views/signUp_view.dart';

import '../../features/intro/presentation/views/intro_view.dart';

abstract class AppRouter {
  static const signUpRoute = '/signUp';
  static const signInRoute = '/signIn';
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
    ],
  );
}
