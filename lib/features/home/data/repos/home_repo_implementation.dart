import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy/features/home/data/failures/failure.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:shopy/features/home/data/repos/home_repo.dart';
import 'package:shopy/features/home/data/services/api_service.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var data = await apiService.get();

      List<ProductModel> products = [];

      for (var element in data) {
        products.add(ProductModel.fromJson(element));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
