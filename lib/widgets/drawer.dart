import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';
import 'package:vrc_finder/presentation/login/login_page.dart';
import 'package:vrc_finder/presentation/user_view/user_page.dart';
import 'package:vrc_finder/router.dart';

class DefaultDrawer extends ConsumerWidget {

  const DefaultDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authApiProvider).value;
    final user = auth!.currentUser!;
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => UserPage(id: user.id)
              ));
            },
            accountName: Text(user.displayName),
            accountEmail: Text(user.statusDescription),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    user.profilePicOverride == ""
                        ? user.currentAvatarImageUrl
                        : user.profilePicOverride
                ),
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    user.userIcon == ""
                        ? user.currentAvatarThumbnailImageUrl
                        : user.userIcon
                )
            )
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("ログアウト"),
              onTap: () async {
                final router = ref.read(routerProvider);
                await auth.logout();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => const LoginPage()
                ), (route) => false);
              }),
        ],
      ),
    );
  }
}