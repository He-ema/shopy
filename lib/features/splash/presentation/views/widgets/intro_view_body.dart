import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/widgets/custom_button.dart';

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
          Spacer(
            flex: 2,
          ),
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, child) => SlideTransition(
              position: slidingAnimation,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset(AssetData.logo)),
            ),
          ),
          Spacer(),
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, child) => SlideTransition(
              position: slidingAnimation,
              child: CustomButton(
                text: 'Sign Up',
                color: Colors.white,
                textColor: kPrimaryColor,
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          AnimatedBuilder(
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
          ),
          SizedBox(
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
