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
            SizedBox(
              height: 8,
            ),
            Text(
              'Nike React Miler',
              style: styles.textStyle14,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    '5 Colors',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                  ),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(
                    top: 3,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffD5DDE0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '\$100',
                  style: styles.textStyle14.copyWith(
                      fontWeight: FontWeight.bold, color: Color(0xff3E4958)),
                ),
                Spacer(),
                GestureDetector(
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
                SizedBox(
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
