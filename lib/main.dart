import 'package:flutter/material.dart';
import 'package:shopy/features/intro/presentation/views/intro_view.dart';

import 'core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
