import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_button.dart';
import 'package:shopy/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:shopy/features/home/presentation/views/widgets/page_view_image.dart';
import 'categories_row.dart';
import 'clipped_rectangle.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClippedRectangle(),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Stack(
              children: [
                const ClippedRectangle(bottom: true),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New products',
                            style: styles.textStyle18,
                          ),
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: CustomButton(
                                text: 'View All', onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ListViewItem(),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
        const Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: SearchAndCamera(),
            ),
            SizedBox(
              height: 6,
            ),
            PageViewImage(),
            SizedBox(
              height: 10,
            ),
            CategoriesRow(),
            SizedBox(
              height: 50,
            ),
          ],
        )
      ],
    );
  }
}
