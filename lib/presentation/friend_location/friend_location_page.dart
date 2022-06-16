import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';
import 'package:vrc_finder/model/location_notifier.dart';
import 'package:vrc_finder/presentation/friend_location/friend_location_tile.dart';
import 'package:vrc_finder/widgets/drawer.dart';

class FriendLocationPage extends ConsumerWidget {
  const FriendLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(locationMapNotifier.notifier).fetch();
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Friend Locations'),
      ),
      body: _ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(locationMapNotifier.notifier).fetch(),
        child: const Icon(Icons.more),
      ),
      drawer: const DefaultDrawer(),
    );
  }
}

class _ListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationMap = ref.watch(locationMapNotifier);
    return RefreshIndicator(
        onRefresh: () async {
          ref.read(locationMapNotifier.notifier).clear();
        },
        child: locationMap.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: locationMap.length,
            itemBuilder: (context, i) {
              return FriendLocationTile(id: locationMap.keys.elementAt(i));
            },
          )
    );
  }
}