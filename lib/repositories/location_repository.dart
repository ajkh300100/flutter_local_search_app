import 'package:dio/dio.dart';
import 'package:flutter_local_search_app/models/location.dart';

class LocationRepository {
  final Dio _dio = Dio();

  Future<List<Location>> searchLocations(String query) async {
    final response = await _dio.get(
      'https://api.naver.com/v1/search/local', // 실제 Naver API URL
      queryParameters: {'query': query},
    );

    final List<Location> locations = (response.data['items'] as List)
        .map((item) => Location.fromJson(item))
        .toList();

    return locations;
  }
}
