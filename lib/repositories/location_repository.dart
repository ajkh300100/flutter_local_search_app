import 'package:dio/dio.dart';
import 'package:flutter_local_search_app/models/location.dart';

class LocationRepository {
  final Dio _dio = Dio();

  static const String clientId = 'your_client_id_here';  // API 키
  static const String clientSecret = 'your_client_secret_here';  // API 시크릿

  Future<List<Location>> searchLocations(String query) async {
    try {
      final response = await _dio.get(
        'https://openapi.naver.com/v1/search/local.json',
        queryParameters: {'query': query, 'display': 5},
        options: Options(
          headers: {
            'X-Naver-Client-Id': clientId,
            'X-Naver-Client-Secret': clientSecret,
          },
        ),
      );

      final List<Location> locations = (response.data['items'] as List)
          .map((item) => Location.fromJson(item))
          .toList();

      return locations;
    } catch (e) {
      rethrow;
    }
  }
}
