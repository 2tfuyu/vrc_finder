import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_common_api.dart';
import 'package:vrc_finder/model/entity/location.dart';
import 'package:vrc_finder/model/state/locations_state.dart';
import 'package:vrc_finder/model/world_format.dart';
import 'package:vrchat_dart/vrchat_dart.dart';

const n = 100;

class LocationsNotifier extends StateNotifier<LocationsState> {
  LocationsNotifier(this._ref) : super(const LocationsState.loading()) {
    state = const LocationsState(locations: []);
  }

  final Ref _ref;
  final Map<String, Location> locations = {};

  Future<void> fetch() async {
    final offset = _ref.read(offsetProvider);
    final api = await _ref.read(vrcApiProvider);
    final response = await api.rawApi.getFriendsApi().getFriends(n: n, offset: offset);
    final friends = response.data;
    if (friends == null) return;

    for (final friend in friends) {
      final locationId = friend.location;
      _ref.read(friendsLengthProvider.notifier).state++;
      if (locationId != null) {
        if (locationId == "private" || locationId == "") continue;
        _addLocation(friend, locationId);
      }
    }
    _notify();
  }

  Future<void> more() async {
    _ref.read(offsetProvider.notifier).state += n;
    await fetch();
  }

  Future<void> refresh() async {
    locations.clear();
    _ref.read(offsetProvider.notifier).state = 0;
    _ref.read(friendsLengthProvider.notifier).state = 0;

    await fetch();
  }

  void _notify() {
    final currentState = state;
    if (currentState is LocationsStateData) {
      state = currentState.copyWith(
        locations: locations.values.toList()
      );
    }
  }

  void _addLocation(LimitedUser user, String locationId) {
    if (!locations.containsKey(locationId)) {
      final location = Location(id: locationId, users: [user]);
      locations.addAll({locationId: location});
      return;
    }

    final location = locations[locationId]!;
    locations[locationId] = location.copyWith(
      users: [...location.users, user]
    );
  }
}

final locationsFetch = FutureProvider((ref) async {
  final locationsNotifier = ref.watch(locationsProvider.notifier);
  await locationsNotifier.fetch();
});

final locationsProvider = StateNotifierProvider<LocationsNotifier, LocationsState>((ref) {
  return LocationsNotifier(ref);
});

final locationProvider = Provider.family((ref, String id) {
  final locationsState = ref.watch(locationsProvider);
  if (locationsState is LocationsStateData) {
    for (final location in locationsState.locations) {
      if (location.id == id) return location;
    }
  }
  return null;
});

final friendsLengthProvider = StateProvider((ref) => 0);

final offsetProvider = StateProvider((ref) => 0);