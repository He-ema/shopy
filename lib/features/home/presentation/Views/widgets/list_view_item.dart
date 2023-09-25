import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/utils/assetData.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      // height: 250,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: productModel.image!,
              fit: BoxFit.fitWidth,
            ),
            // Image.asset(
            //   AssetData.test, fit: BoxFit.fitWidth,
            //   //width: 180,
            // ),
            const SizedBox(
              height: 8,
            ),
            Text(
              productModel.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: styles.textStyle14,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(
                    top: 3,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffD5DDE0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '5 Colors',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '\$' '${productModel.price}',
                  style: styles.textStyle14.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff3E4958)),
                ),
                const Spacer(),
                GestureDetector(
                  child: const Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
