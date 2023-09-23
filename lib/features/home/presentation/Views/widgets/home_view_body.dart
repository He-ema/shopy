import 'package:flutter/material.dart';
import 'package:shopy/features/home/presentation/views/widgets/categories_row.dart';
import 'package:shopy/features/home/presentation/views/widgets/page_view_image.dart';

import 'clipped_rectangle.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Stack(
          children: [
            ClippedRectangle(),
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
              ],
            )
          ],
        ),
      ],
    );
  }
}
