import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/features/intro/presentation/views/widgets/intro_view_body.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: IntroViewBody(),
    );
  }
}
