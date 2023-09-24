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
        const ClippedRectangle(),
        const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClippedRectangle(bottom: true)),
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: SearchAndCamera(),
            ),
            const SizedBox(
              height: 6,
            ),
            const PageViewImage(),
            const SizedBox(
              height: 10,
            ),
            const CategoriesRow(),
            const SizedBox(
              height: 50,
            ),
            Text('Newest'),
            SizedBox(
              height: 10,
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
    );
  }
}
