import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/core/utils/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopy/features/signIn/presentation/views/widgets/sign_In_View_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const Scaffold(
        body: SignInViewBody(),
      ),
    );
  }
}
