import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_app_bar.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:shopy/features/home/presentation/views/widgets/clipped_rectangle.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  CollectionReference favourites =
      FirebaseFirestore.instance.collection(kFavouriteCollectionReference);

  bool isThere = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  void check() async {
    isThere = await exist(id: widget.productModel.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Stack(
      children: [
        ClippedRectangle(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              CustomAppBar(
                text: 'Product details',
                isWhite: true,
                onPressed: () {
                  GoRouter.of(context).pop('Returned');
                },
              ),
              SizedBox(
                height: 12,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Hero(
                      tag: widget.productModel.id.toString(),
                      child: CachedNetworkImage(
                        imageUrl: widget.productModel.image!,
                        fit: BoxFit.fitWidth,
                      )),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 12,
              ),
              Text(
                'Name : ${widget.productModel.name}',
                style: styles.textStyle16,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Price : \$${widget.productModel.price}',
                style: styles.textStyle16,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Description : ${widget.productModel.description}',
                style: styles.textStyle16,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 22,
              ),
              CustomButton(
                text: isThere ? 'Remove From Wish List' : 'Add to Wish List',
                onPressed: () async {
                  if (isThere == false) {
                    await favourites
                        .doc(widget.productModel.id.toString())
                        .set({
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
              ),
              Spacer(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
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
