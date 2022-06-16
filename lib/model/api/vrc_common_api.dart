import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrchat_dart/vrc_api_container.dart';

final vrcApiProvider = Provider((ref) => VrcApiContainer().create());

final rawApiProvider = Provider((ref) async {
  final api = await ref.watch(vrcApiProvider);
  return api.rawApi;
});

final authApiProvider = FutureProvider((ref) async {
  final api = await ref.watch(vrcApiProvider);
  return api.auth;
});

final streamingApiProvider = FutureProvider((ref) async {
  final api = await ref.watch(vrcApiProvider);
  return api;
});