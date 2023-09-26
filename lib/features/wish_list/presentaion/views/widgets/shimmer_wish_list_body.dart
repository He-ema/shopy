import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/shimmer_wish_list_item.dart';

class ShimmerWishListBody extends StatelessWidget {
  const ShimmerWishListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ShimmerWishListItem(),
          ShimmerWishListItem(),
          ShimmerWishListItem(),
          ShimmerWishListItem(),
          ShimmerWishListItem(),
        ],
      ),
    );
  }
}
