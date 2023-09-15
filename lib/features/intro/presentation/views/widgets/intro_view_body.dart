import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/widgets/custom_button.dart';

import 'logo_widget.dart';
import 'signIn_widget.dart';
import 'signUp_widget.dart';

class IntroViewBody extends StatefulWidget {
  const IntroViewBody({super.key});

  @override
  State<IntroViewBody> createState() => _IntroViewBodyState();
}

class _IntroViewBodyState extends State<IntroViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 2,
          ),
          LogoWidget(slidingAnimation: slidingAnimation),
          const Spacer(),
          SignUpWidget(slidingAnimation: slidingAnimation),
          const SizedBox(
            height: 5,
          ),
          SignInWidget(slidingAnimation: slidingAnimation),
          const SizedBox(
            height: 55,
          )
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
