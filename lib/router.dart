import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/presentation/friend_location/friend_location_page.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'login',
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const FriendLocationPage(),
        ),
      ),
      GoRoute(
        name: 'locations',
        path: '/locations',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const FriendLocationPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
});