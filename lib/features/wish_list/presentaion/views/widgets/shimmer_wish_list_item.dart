import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/shimmer_skelton.dart';

class ShimmerWishListItem extends StatelessWidget {
  const ShimmerWishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Skelton(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.2,
              opacity: 0.3,
              borderRaduis: 12),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Skelton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.02,
                  opacity: 0.3,
                  borderRaduis: 12),
              const SizedBox(
                height: 20,
              ),
              Skelton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.02,
                  opacity: 0.3,
                  borderRaduis: 12),
              const SizedBox(
                height: 20,
              ),
              Skelton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.02,
                  opacity: 0.3,
                  borderRaduis: 12),
            ],
          ),
        ],
      ),
    );
  }
}
