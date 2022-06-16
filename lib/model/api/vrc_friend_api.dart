import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';

final friendApiProvider = Provider((ref) async {
  final rawApi = await ref.watch(rawApiProvider);
  return rawApi.getFriendsApi();
});

const n = 50; // getFriendsで取得する要素数 max:100

final getFriends = FutureProvider.family((ref, int offset) async {
  final friendApi = await ref.watch(friendApiProvider);
  return friendApi.getFriends(n: n, offset: offset);
});

final friend = FutureProvider.family((ref, String id) async {
  final friendApi = await ref.watch(friendApiProvider);
  return friendApi.friend(userId: id);
});

final getFriendStatus = FutureProvider.family((ref, String id) async {
  final friendApi = await ref.watch(friendApiProvider);
  return friendApi.getFriendStatus(userId: id);
});

final unfriend = FutureProvider.family((ref, String id) async {
  final friendApi = await ref.watch(friendApiProvider);
  return friendApi.unfriend(userId: id);
});

final deleteFriendRequest = FutureProvider.family((ref, String id) async {
  final friendApi = await ref.watch(friendApiProvider);
  return friendApi.deleteFriendRequest(userId: id);
});