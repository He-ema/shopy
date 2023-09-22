import 'package:flutter/material.dart';
import 'package:shopy/core/utils/assetData.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(
            0xffD5DDE0,
          ),
        ),
        child: Image.asset(
          AssetData.google,
          height: 25,
        ),
      ),
    );
  }
}
