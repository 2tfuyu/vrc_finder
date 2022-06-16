import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';
import 'package:vrc_finder/model/world_format.dart';

final offsetCounterProvider = StateProvider<int>((ref) => 0);

final locationProvider = Provider.family(
    (ref, String id) => ref.watch(locationMapNotifier)[id]
);

final locationIdsProvider = Provider(
    (ref) => ref.watch(locationMapNotifier).keys.toList()
);

final locationMapNotifier = StateNotifierProvider<LocationNotifier, LocationMap>(
    (ref) => LocationNotifier(ref)
);

typedef LocationMap = Map<String, List<String>>;

class LocationNotifier extends StateNotifier<LocationMap> {
  LocationNotifier(this.ref) : super({});

  final Ref ref;

  void fetch() {
    print("fetched");
    final tempLocationMap = state;
    final offset = ref.read(offsetCounterProvider.notifier).state;
    final friendsProvider = ref.watch(getFriends(offset));

    friendsProvider.whenData((response) {
      final friends = response.data!;
      for (final friend in friends) {
        if (!RegExp(worldIdRegExp).hasMatch(friend.location!)) continue;
        if (friend.location == "") continue;
        if (!tempLocationMap.containsKey(friend.location)) {
          tempLocationMap[friend.location!] = [];
        }
        if (!tempLocationMap[friend.location]!.contains(friend.id)) {
          tempLocationMap[friend.location]!.add(friend.id);
        }
      }
    });
    state = tempLocationMap;
    ref.read(offsetCounterProvider.notifier).state + n;
  }

  void clear() {
    ref.read(offsetCounterProvider.notifier).state = 0;
    state = {};
    fetch();
  }
}