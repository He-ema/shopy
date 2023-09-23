import 'package:flutter/material.dart';
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
        ClippedRectangle(),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClippedRectangle(bottom: true)),
        Column(
          children: [
            SizedBox(
              height: 63,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: SearchAndCamera(),
            ),
            SizedBox(
              height: 10,
            ),
            PageViewImage(),
            SizedBox(
              height: 10,
            ),
            CategoriesRow(),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListViewItem(),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
