import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';
import 'package:vrc_finder/model/api/vrc_users_api.dart';
import 'package:vrc_finder/model/world_format.dart';
import 'package:vrchat_dart/vrchat_dart.dart';

class WorldTile extends ConsumerWidget {
  final String location;

  const WorldTile({Key? key, required this.location})  : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worldId = RegExp(worldIdRegExp)
        .firstMatch(location)!.group(0);
    final world = ref.watch(getWorld(worldId!));
    final instance = ref.watch(getWorldInstance(location)).asData;

    return world.when(
        data: (world) => ListTile(
          leading: Image.network(
              world.data!.thumbnailImageUrl,
              fit: BoxFit.fill
          ),
          title: Text(world.data!.name),
          subtitle: Text(
              instance == null
                  ? ""
                  : '''${instance.value.data!.nUsers.toString()} / ${instance.value.data!.capacity.toString()}
                  '''
          ),
        ),
        error: (error, _) => const Text("world error"),
        loading: () => const CircularProgressIndicator()
    );
  }
}