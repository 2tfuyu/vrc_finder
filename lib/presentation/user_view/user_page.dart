import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_users_api.dart';
import 'package:vrchat_dart/vrchat_dart.dart';

class UserPage extends ConsumerWidget {
  const UserPage({Key? key, required this.user})  : super(key: key);

  final LimitedUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
            middle: Text('Friend Locations')
        ),
        body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                user.profilePicOverride == ""
                                    ? user.currentAvatarImageUrl
                                    : user.profilePicOverride
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Container(
                        alignment: const Alignment(0.0,2.5),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              user.userIcon == ""
                                  ? user.currentAvatarThumbnailImageUrl
                                  : user.userIcon
                          ),
                          radius: 60.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text(
                      user.displayName,
                      style: const TextStyle(
                          fontSize: 25.0,
                          color:Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.status.name + ": " + user.statusDescription,
                    style: const TextStyle(
                        fontSize: 18.0,
                        color:Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  Text(
                      user.bio ?? "",
                      style: const TextStyle(
                          fontSize: 15.0,
                          color:Colors.black45,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300
                      )
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
        )
    );
  }
}
