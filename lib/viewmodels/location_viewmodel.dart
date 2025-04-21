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
    final locations = await locationRepository.searchLocations(query);
    state = locations;
  }
}
