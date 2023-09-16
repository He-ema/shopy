import 'package:flutter/material.dart';
import 'package:shopy/features/signIn/presentation/views/widgets/sign_In_View_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInViewBody(),
    );
  }
}
