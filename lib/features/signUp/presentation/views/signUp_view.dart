import 'package:flutter/material.dart';
import 'package:shopy/features/signUp/presentation/views/widgets/signUp_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SignUpViewBody()),
    );
  }
}
