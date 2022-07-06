import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/entity/location.dart';
import 'package:vrc_finder/presentation/friend_location/friend_tile.dart';
import 'package:vrc_finder/presentation/friend_location/world_tile.dart';

class FriendLocationTile extends ConsumerWidget {
  FriendLocationTile({
    required this.location,
  }) : super(key: ValueKey(location.id));

  final Location location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: WorldTile(location: location.id)
              ),
            ]
                + location.users.map((user) =>
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FriendTile(user: user)
                    )
                ).toList()
        )
    );
  }
}