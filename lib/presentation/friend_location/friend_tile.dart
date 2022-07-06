import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrchat_dart/vrchat_dart.dart';

import '../../model/trust_level.dart';
import '../user_view/user_page.dart';

class FriendTile extends ConsumerWidget {
  const FriendTile({Key? key, required this.user})  : super(key: key);

  final LimitedUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: getTrustedLevelColor(getTrustLevel(user.tags.asList())),
              width: 2.0
          ),
          borderRadius: BorderRadius.circular(4.0)
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              user.userIcon == ""
                  ? user.currentAvatarThumbnailImageUrl
                  : user.userIcon
          ),
          backgroundColor: Colors.transparent,
        ),
        title: Text(user.displayName),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => UserPage(user: user)
          ));
        },
      ),
    );
  }
}