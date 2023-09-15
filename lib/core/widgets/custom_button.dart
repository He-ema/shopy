import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.color,
      this.onPressed,
      this.textColor,
      this.isElevated = true});
  final String text;
  final bool isElevated;
  final Color? color;
  final Color? textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: onPressed,
      height: 60,
      elevation: isElevated ? 2 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: color ?? kPrimaryColor,
      textColor: textColor ?? Colors.white,
      child: Text(
        text,
        style: styles.textStyle16,
      ),
    );
  }
}
