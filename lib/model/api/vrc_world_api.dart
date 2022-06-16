import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';

final worldApiProvider = Provider((ref) async {
  final rawApi = await ref.watch(rawApiProvider);
  return rawApi.getWorldsApi();
});

final getWorld = FutureProvider.family((ref, String id) async {
  final worldApi = await ref.watch(worldApiProvider);
  return worldApi.getWorld(worldId: id);
});

final getWorldInstance = FutureProvider.family((ref, String locationId) async {
  final worldId = locationId.split(":").first;
  final instanceId = locationId.split(":").last;

  final worldApi = await ref.watch(worldApiProvider);
  return worldApi.getWorldInstance(worldId: worldId, instanceId: instanceId);
});