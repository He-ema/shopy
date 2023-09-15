import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';

class CustomOrWidget extends StatelessWidget {
  const CustomOrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text('Or sign up with',
            style: styles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
