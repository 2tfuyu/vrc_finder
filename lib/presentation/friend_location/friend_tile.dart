import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_users_api.dart';

import '../../model/trust_level.dart';
import '../user_view/user_page.dart';

class FriendTile extends ConsumerWidget {
  final String id;

  const FriendTile({Key? key, required this.id})  : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getUser(id));
    return user.when(
        data: (user) => Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: getTrustedLevelColor(getTrustLevel(user!.data!.tags.asList())),
                  width: 2.0
              ),
              borderRadius: BorderRadius.circular(4.0)
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  user.data!.userIcon == ""
                      ? user.data!.currentAvatarThumbnailImageUrl
                      : user.data!.userIcon
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(user.data!.displayName),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => UserPage(id: id)
              ));
            },
          ),
        ),
        error: (error, _) => const Text("error"),
        loading: () => const CircularProgressIndicator()
    );
  }
}