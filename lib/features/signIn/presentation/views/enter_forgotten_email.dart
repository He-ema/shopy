import 'package:flutter/material.dart';
import 'package:shopy/features/signIn/presentation/views/widgets/enter_forgotten_email_body.dart';

class EnterForgottenEmail extends StatelessWidget {
  const EnterForgottenEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EnterForgottenEmailBody(),
    );
  }
}
