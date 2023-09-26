import 'package:shopy/constants.dart';

class WishListItemModel {
  final String name;
  final String image;
  final String quantity;
  final String id;
  final double price;

  WishListItemModel(
      {required this.name,
      required this.image,
      required this.quantity,
      required this.id,
      required this.price});

  factory WishListItemModel.fromJson(jsonData) {
    return WishListItemModel(
        name: jsonData[kName],
        image: jsonData[kImage],
        quantity: jsonData[kQuantity],
        id: jsonData[kId],
        price: jsonData[kPrice]);
  }
}