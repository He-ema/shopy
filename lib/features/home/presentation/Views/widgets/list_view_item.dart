import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListViewItem extends StatefulWidget {
  const ListViewItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  CollectionReference favourites =
      FirebaseFirestore.instance.collection(kFavouriteCollectionReference);
  bool isThere = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.mounted) {
      check();
    }
  }

  void check() async {
    isThere = await exist(id: widget.productModel.id.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: 150,
          // height: 250,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 150,
                  child: CachedNetworkImage(
                    imageUrl: widget.productModel.image!,
                    // ignore: prefer_const_constructors
                    placeholder: (context, url) => SpinKitSpinningLines(
                      color: kPrimaryColor,
                    ),
                    maxHeightDiskCache: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                // Image.asset(
                //   AssetData.test, fit: BoxFit.fitWidth,
                //   //width: 180,
                // ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.productModel.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: styles.textStyle14,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(
                        top: 3,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffD5DDE0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '5 Colors',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$' '${widget.productModel.price}',
                      style: styles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff3E4958)),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: IconButton(
            onPressed: () async {
              if (isThere == false) {
                await favourites.doc(widget.productModel.id.toString()).set({
                  kImage: widget.productModel.image,
                  kName: widget.productModel.name,
                  kQuantity: 1,
                  kPrice: widget.productModel.price,
                  kId: widget.productModel.id,
                });
                isThere = true;
                setState(() {});
              } else {
                favourites.doc(widget.productModel.id.toString()).delete();
                isThere = false;
                setState(() {});
              }
            },
            icon: Icon(
              Icons.favorite,
              color: isThere ? Colors.red : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> exist({required String id}) async {
    bool docExist = false;
    var doc = favourites.doc(id);
    await doc.get().then((doc) {
      if (doc.exists) {
        docExist = true;
        if (this.mounted) {
          setState(() {});
        }
      }
    });
    return docExist;
  }
}
