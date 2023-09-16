import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: const Text(
          'Forgot Password ?',
          style: styles.textStyle14,
        ),
      ),
    );
  }
}
