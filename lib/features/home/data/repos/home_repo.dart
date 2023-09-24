import 'package:dartz/dartz.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';

import '../failures/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
