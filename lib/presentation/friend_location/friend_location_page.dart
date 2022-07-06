import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_common_api.dart';
import 'package:vrc_finder/model/notifier/locations_notifier.dart';
import 'package:vrc_finder/model/state/locations_state.dart';
import 'package:vrc_finder/presentation/friend_location/friend_location_tile.dart';
import 'package:vrc_finder/presentation/login/login_page.dart';
import 'package:vrc_finder/widgets/drawer.dart';

class FriendLocationPage extends ConsumerWidget {
  const FriendLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(locationsFetch).when(
        data: (data) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Friend Locations'),
            ),
            body: _ListView(),
            floatingActionButton: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final friendsLength = ref.watch(friendsLengthProvider);
                return ((friendsLength == n) && (n > 0))
                    ? FloatingActionButton(
                  onPressed: () => ref.read(locationsProvider.notifier).more(),
                  child: const Icon(Icons.more),
                )
                    : Container();
              }
            ),
            drawer: const DefaultDrawer(),
          );
        },
        error: (error, _) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator())
    );

  }
}

class _ListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationsState = ref.watch(locationsProvider);

    return RefreshIndicator(
        onRefresh: () async {
          final auth = ref.read(authApiProvider);
          if (auth.value!.currentUser == null) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) => const LoginPage()
            ), (route) => false);
          }
          final locationsNotifier = ref.watch(locationsProvider.notifier);
          await locationsNotifier.refresh();
        },
        child: buildLocations(locationsState)
    );
  }

  Widget buildLocations(LocationsState state) {
    if (state is LocationsStateLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is LocationsStateData) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: state.locations.length,
        itemBuilder: (context, i) {
          return FriendLocationTile(location: state.locations.elementAt(i));
        },
      );
    }
    return Container();
  }
}