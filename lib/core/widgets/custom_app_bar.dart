import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    this.onPressed,
    this.isWhite = false,
  });
  final String text;
  final bool isWhite;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed ??
              () {
                GoRouter.of(context).pop();
              },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: isWhite ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          text,
          style: styles.textStyle26
              .copyWith(color: isWhite ? Colors.white : Colors.black),
        )
      ],
    );
  }
}
