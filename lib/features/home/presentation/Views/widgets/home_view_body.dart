import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45))),
        ),
        SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(AssetData.men)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Men',
                  style: styles.textStyle12,
                )
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(AssetData.women)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Women',
                  style: styles.textStyle12,
                )
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(AssetData.kids)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Kids',
                  style: styles.textStyle12,
                )
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(AssetData.sale)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Sale',
                  style: styles.textStyle12,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
