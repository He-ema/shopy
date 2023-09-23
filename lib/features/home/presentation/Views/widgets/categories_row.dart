import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assetData.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(AssetData.men)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Men',
              style: styles.textStyle12,
            )
          ],
        ),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(AssetData.women)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Women',
              style: styles.textStyle12,
            )
          ],
        ),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(AssetData.kids)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Kids',
              style: styles.textStyle12,
            )
          ],
        ),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(AssetData.sale)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Sale',
              style: styles.textStyle12,
            )
          ],
        ),
      ],
    );
  }
}
