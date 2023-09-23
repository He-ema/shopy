import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/app_router.dart';
import 'package:shopy/core/utils/styles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.forgotPasswordRoute);
        },
        child: const Text(
          'Forgot Password ?',
          style: styles.textStyle14,
        ),
      ),
    );
  }
}
