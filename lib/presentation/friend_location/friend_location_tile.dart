import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/location_notifier.dart';
import 'package:vrc_finder/presentation/friend_location/friend_tile.dart';
import 'package:vrc_finder/presentation/friend_location/world_tile.dart';

class FriendLocationTile extends ConsumerWidget {
  FriendLocationTile({
    required this.id,
  }) : super(key: ValueKey(id));

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdList = ref.watch(locationProvider(id))!;
    return Card(
        child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: WorldTile(location: id)
              ),
            ]
                + userIdList.map((userId) =>
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FriendTile(id: userId)
                    )
                ).toList()
        )
    );
  }
}