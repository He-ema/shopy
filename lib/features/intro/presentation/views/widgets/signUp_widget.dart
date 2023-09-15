import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/app_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) => SlideTransition(
        position: slidingAnimation,
        child: CustomButton(
          text: 'Sign Up',
          color: Colors.white,
          textColor: kPrimaryColor,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.signUpRoute);
          },
        ),
      ),
    );
  }
}
