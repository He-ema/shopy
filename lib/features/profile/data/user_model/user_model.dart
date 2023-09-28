import 'package:shopy/constants.dart';

class UserModel {
  final String name;
  final String email;
  final String image;

  UserModel({required this.name, required this.email, required this.image});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
        name: jsonData[kName],
        email: jsonData[kEmail],
        image: jsonData[kImage]);
  }
}
