import 'package:flutter/material.dart';

class ShimmerClippedRectangle extends StatelessWidget {
  const ShimmerClippedRectangle({
    super.key,
    this.bottom = false,
  });
  final bool bottom;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottom
          ? MediaQuery.of(context).size.height * 0.41
          : MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: bottom
              ? const BorderRadius.only(
                  topLeft: Radius.circular(38),
                  topRight: Radius.circular(38),
                )
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(38),
                  bottomRight: Radius.circular(38))),
    );
  }
}
