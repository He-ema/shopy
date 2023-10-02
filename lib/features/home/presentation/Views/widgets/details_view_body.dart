import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_app_bar.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:shopy/features/home/presentation/views/widgets/clipped_rectangle.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;
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
                      tag: productModel.id.toString(),
                      child: CachedNetworkImage(
                        imageUrl: productModel.image!,
                        fit: BoxFit.fitWidth,
                      )),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 12,
              ),
              Text(
                'Name : ${productModel.name}',
                style: styles.textStyle16,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Price : \$${productModel.price}',
                style: styles.textStyle16,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Description : ${productModel.description}',
                style: styles.textStyle16,
                textAlign: TextAlign.start,
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
