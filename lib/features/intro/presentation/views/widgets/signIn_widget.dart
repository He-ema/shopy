import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
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
          isElevated: false,
          text: 'Sign in',
          textColor: Colors.white,
          color: kPrimaryColor,
          onPressed: () {},
        ),
      ),
    );
  }
}
