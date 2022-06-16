import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';
import 'package:vrc_finder/presentation/friend_location/friend_location_page.dart';
import 'package:vrc_finder/presentation/login/login_page.dart';
import 'package:vrc_finder/router.dart';
import 'package:vrchat_dart/vrchat_dart.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final authApi = ref.watch(authApiProvider);

    return MaterialApp(
      home: authApi.when(
          data: (api) {
            if (api.currentUser == null) {
              return const LoginPage();
            }
            return const FriendLocationPage();
          },
          error: (error, _) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator())
      ),
    );
  }
}