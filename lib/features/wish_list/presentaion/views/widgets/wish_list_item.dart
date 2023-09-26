import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/wish_list/data/wish_list_item_model/wish_list_item_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assetData.dart';
import '../../manager/wish_list_cubit/wish_list_cubit.dart';

class WishListItem extends StatefulWidget {
  const WishListItem({
    super.key,
    required this.wishListItemModel,
  });
  final WishListItemModel wishListItemModel;

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  final CollectionReference favourites =
      FirebaseFirestore.instance.collection(kFavouriteCollectionReference);
  @override
  Widget build(BuildContext context) {
    int quantity = widget.wishListItemModel.quantity;
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
                decoration: BoxDecoration(),
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: widget.wishListItemModel.image,
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
                        if (widget.wishListItemModel.quantity > 1) {
                          await favourites
                              .doc(widget.wishListItemModel.id)
                              .update({
                            kQuantity: widget.wishListItemModel.quantity - 1,
                          });
                        } else {
                          await favourites
                              .doc(widget.wishListItemModel.id)
                              .delete();
                        }
                        BlocProvider.of<WishListCubit>(context)
                            .getWishListItems();
                        setState(() {});
                      },
                      icon: Icon(Icons.remove)),
                  Text('$quantity'),
                  IconButton(
                      onPressed: () async {
                        quantity++;
                        setState(() {});
                        await favourites
                            .doc(widget.wishListItemModel.id)
                            .update({
                          kQuantity: widget.wishListItemModel.quantity + 1,
                        });
                      },
                      icon: Icon(Icons.add))
                ],
              )
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
