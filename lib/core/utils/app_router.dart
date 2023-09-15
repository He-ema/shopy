import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/intro_view.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroView(),
    ),
  ],
);
