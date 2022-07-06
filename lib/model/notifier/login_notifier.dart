import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailProvider = StateProvider.autoDispose((ref) {
  return '';
});

final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});

final toastTextProvider = StateProvider.autoDispose((ref) {
  return '';
});