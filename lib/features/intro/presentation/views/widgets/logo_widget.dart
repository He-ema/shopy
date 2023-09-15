import 'package:flutter/material.dart';

import '../../../../../core/utils/assetData.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
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
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(AssetData.logo)),
      ),
    );
  }
}
