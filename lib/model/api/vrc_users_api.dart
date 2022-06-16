import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';

final userApiProvider = Provider((ref) async {
  final rawApi = await ref.watch(rawApiProvider);
  return rawApi.getUsersApi();
});

final getUser = FutureProvider.family((ref, String id) async {
  if (id == "") return null;
  final usersApi = await ref.watch(userApiProvider);
  return usersApi.getUser(userId: id);
});
