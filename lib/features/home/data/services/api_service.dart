import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://shoes-collections.p.rapidapi.com/shoes';
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get() async {
    var response = await _dio.get(
      baseUrl,
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '229abfe9cbmsh5d68b54532908eap192ab2jsnd73d04c64082',
          'X-RapidAPI-Host': 'shoes-collections.p.rapidapi.com'
        },
      ),
    );
    return response.data;
  }
}
