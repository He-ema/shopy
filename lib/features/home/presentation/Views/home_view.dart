import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/features/home/data/repos/home_repo_implementation.dart';
import 'package:shopy/features/home/data/services/api_service.dart';
import 'package:shopy/features/home/presentation/Views/widgets/home_view_body.dart';
import 'package:shopy/features/home/presentation/manager/get_products_cubit/get_products_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetProductsCubit(HomeRepoImplementation(ApiService(Dio()))),
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
