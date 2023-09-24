import 'package:shopy/features/home/data/helpers/api.dart';

import '../product_model/product_model.dart';

class GetAllProducrService {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> RowData = await Api().get(
      Url: 'https://shoes-collections.p.rapidapi.com/shoes',
    );
    List<ProductModel> data = [];
    for (int i = 0; i < RowData.length; i++) {
      data.add(ProductModel.fromJson(RowData[i]));
    }
    print(data);
    return data;
  }
}
