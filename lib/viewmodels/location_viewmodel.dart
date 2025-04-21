import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_search_app/models/location.dart';
import 'package:flutter_local_search_app/repositories/location_repository.dart';

final locationProvider = StateNotifierProvider<LocationViewModel, List<Location>>(
  (ref) => LocationViewModel(LocationRepository()),
);

class LocationViewModel extends StateNotifier<List<Location>> {
  final LocationRepository locationRepository;

  LocationViewModel(this.locationRepository) : super([]);

  Future<void> searchLocations(String query) async {
    try {
      final locations = await locationRepository.searchLocations(query);
      state = locations;
    } catch (e) {
      // 예외 처리 추가 (에러 메시지 표시 또는 로딩 상태 처리 등)
      state = [];
    }
  }
}
