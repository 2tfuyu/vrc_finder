import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_common_api.dart';

final favoritesApiProvider = Provider((ref) async {
  final rawApi = await ref.read(rawApiProvider);
  return rawApi.getFavoritesApi();
});

final getFavorite = FutureProvider.family((ref, String id) async {
  final favoritesApi = await ref.read(favoritesApiProvider);
  return favoritesApi.getFavorite(favoriteId: id);
});
