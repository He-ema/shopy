import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopy/features/home/presentation/views/widgets/shimmer_clipped_rectangle.dart';

class ShimmerViewBody extends StatelessWidget {
  const ShimmerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.white,
          child: ShimmerClippedRectangle(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.white,
            child: ShimmerClippedRectangle(bottom: true),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Skelton(width: 200, height: 40, opacity: 0.2),
                SizedBox(
                  width: 30,
                ),
                Skelton(width: 40, height: 40, opacity: 0.2),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Skelton(width: 250, height: 150, opacity: 0.2),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skelton(width: 50, height: 50, opacity: 0.2),
                  Skelton(width: 50, height: 50, opacity: 0.2),
                  Skelton(width: 50, height: 50, opacity: 0.2),
                  Skelton(width: 50, height: 50, opacity: 0.2),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Skelton(width: 150, height: 250, opacity: 0.2),
            ),
          ],
        )
      ],
    );
  }

  Shimmer Skelton(
      {required double width,
      required double height,
      required double opacity}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(opacity),
          borderRadius: BorderRadius.circular(12),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
