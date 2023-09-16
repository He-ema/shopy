import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/app_router.dart';
import 'package:shopy/core/utils/styles.dart';

class AlreadyHavaAnAccount extends StatelessWidget {
  const AlreadyHavaAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement(AppRouter.signInRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account ? ',
            style: styles.textStyle14,
          ),
          Text(
            'Sign In',
            style: styles.textStyle14.copyWith(
                color: const Color(
                  0xff3E4958,
                ),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
