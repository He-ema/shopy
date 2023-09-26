import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../core/utils/assetData.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black, width: 0.5)),
      child: Slidable(
        startActionPane: ActionPane(motion: BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.delete,
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(20),
            borderRadius: BorderRadius.circular(14),
          ),
        ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                    decoration: BoxDecoration(),
                    width: 120,
                    height: 120,
                    child: Image.asset(
                      AssetData.test,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Column(
              children: [
                Text(
                  'ffsafasdsad',
                  style: styles.textStyle14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'dsadsad',
                  style:
                      styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                    Text('dsadasd'),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
