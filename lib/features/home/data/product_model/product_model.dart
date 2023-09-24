import 'package:equatable/equatable.dart';

import 'rating.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? name;
  final num? price;
  final String? image;
  final String? description;
  final int? quantity;
  final Rating? rating;

  const ProductModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.quantity,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as num?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        quantity: json['quantity'] as int?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'image': image,
        'description': description,
        'quantity': quantity,
        'rating': rating?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      price,
      image,
      description,
      quantity,
      rating,
    ];
  }
}
