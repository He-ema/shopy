import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/wish_list_item.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Wish List',
            style: styles.textStyle26,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => WishListItem(),
            ),
          )
        ],
      ),
    );
  }
}
