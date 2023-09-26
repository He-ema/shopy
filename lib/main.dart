import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/features/home/data/repos/home_repo_implementation.dart';
import 'package:shopy/features/home/data/services/api_service.dart';
import 'package:shopy/features/home/presentation/manager/get_products_cubit/get_products_cubit.dart';
import 'package:shopy/simple_bloc_observer.dart';

import 'core/utils/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit(
        HomeRepoImplementation(
          ApiService(
            Dio(),
          ),
        ),
      )..getAllProduct(),
      child: MaterialApp.router(
        theme:
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
