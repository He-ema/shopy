import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          text,
          style: styles.textStyle26,
        )
      ],
    );
  }
}
