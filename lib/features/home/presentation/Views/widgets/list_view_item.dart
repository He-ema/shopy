import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../core/utils/assetData.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
  });

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
            Image.asset(
              AssetData.test, fit: BoxFit.fitWidth,
              //width: 180,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Nike React Miler',
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
                  '\$100',
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
