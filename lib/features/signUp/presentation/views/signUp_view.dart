import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/core/utils/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopy/features/signUp/presentation/views/widgets/signUp_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpViewBody(),
      ),
    );
  }
}
