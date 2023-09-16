import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../core/utils/app_router.dart';

class DoesnotHavaAccount extends StatelessWidget {
  const DoesnotHavaAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement(AppRouter.signUpRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Dont\'t have an account ? ',
            style: styles.textStyle14,
          ),
          Text(
            'Sign Up',
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
