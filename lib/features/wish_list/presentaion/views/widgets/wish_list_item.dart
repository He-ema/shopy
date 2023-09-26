import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/wish_list/data/wish_list_item_model/wish_list_item_model.dart';

import '../../../../../core/utils/assetData.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({
    super.key,
    required this.onPressed,
    required this.wishListItemModel,
  });
  final void Function(BuildContext) onPressed;
  final WishListItemModel wishListItemModel;
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
            onPressed: onPressed,
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
                  child: CachedNetworkImage(
                    imageUrl: wishListItemModel.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Spacer(),
            Column(
              children: [
                Container(
                  width: 100,
                  child: Text(
                    wishListItemModel.name,
                    style: styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$' + wishListItemModel.price.toString(),
                  style:
                      styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                    Text(wishListItemModel.quantity.toString()),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add))
                  ],
                )
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
