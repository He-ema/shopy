import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/widgets/custom_button.dart';

class IntroViewBody extends StatelessWidget {
  const IntroViewBody({super.key});

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
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(AssetData.logo)),
          Spacer(),
          CustomButton(
            text: 'Sign Up',
            color: Colors.white,
            textColor: kPrimaryColor,
            onPressed: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
            isElevated: false,
            text: 'Sign in',
            textColor: Colors.white,
            color: kPrimaryColor,
            onPressed: () {},
          ),
          SizedBox(
            height: 55,
          )
        ],
      ),
    );
  }
}
