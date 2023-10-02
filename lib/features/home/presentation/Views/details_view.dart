import 'package:flutter/material.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:shopy/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(productModel: productModel),
    );
  }
}
