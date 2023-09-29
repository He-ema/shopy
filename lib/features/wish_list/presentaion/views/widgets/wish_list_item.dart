import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/wish_list/data/wish_list_item_model/wish_list_item_model.dart';

import '../../../../../constants.dart';

class WishListItem extends StatefulWidget {
  const WishListItem({
    super.key,
    required this.wishListItemModel,
    required this.deleteItem,
  });
  final WishListItemModel wishListItemModel;
  final VoidCallback deleteItem;

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  final CollectionReference favourites =
      FirebaseFirestore.instance.collection(kFavouriteCollectionReference);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black, width: 0.5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: const BoxDecoration(),
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: widget.wishListItemModel.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Container(
                width: 100,
                child: Text(
                  widget.wishListItemModel.name,
                  style: styles.textStyle14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '\$${widget.wishListItemModel.price}',
                style: styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        widget.wishListItemModel.quantity--;
                        setState(() {});
                        await favourites
                            .doc(widget.wishListItemModel.id.toString())
                            .update({
                          kQuantity: widget.wishListItemModel.quantity,
                        });

                        if (widget.wishListItemModel.quantity == 0) {
                          widget.deleteItem();
                        }
                      },
                      icon: const Icon(Icons.remove)),
                  Text(widget.wishListItemModel.quantity.toString()),
                  IconButton(
                      onPressed: () async {
                        widget.wishListItemModel.quantity++;
                        setState(() {});
                        await favourites
                            .doc(widget.wishListItemModel.id.toString())
                            .update({
                          kQuantity: widget.wishListItemModel.quantity,
                        });
                      },
                      icon: const Icon(Icons.add))
                ],
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
