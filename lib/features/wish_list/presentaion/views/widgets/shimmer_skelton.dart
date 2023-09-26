import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer Skelton(
    {required double width,
    required double height,
    required double opacity,
    @required double? borderRaduis}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.5),
    highlightColor: Colors.white,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(opacity),
        borderRadius: BorderRadius.circular(borderRaduis ?? 12),
      ),
      width: width,
      height: height,
    ),
  );
}
