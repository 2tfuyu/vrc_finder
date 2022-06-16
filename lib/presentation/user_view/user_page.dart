import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_users_api.dart';

class UserPage extends ConsumerWidget {
  final String id;

  const UserPage({Key? key, required this.id})  : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(getUser(id));
    return Scaffold(
        appBar: const CupertinoNavigationBar(
            middle: Text('Friend Locations')
        ),
        body: SingleChildScrollView(
            child: user.when(
                data: (user) => SafeArea(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    user!.data!.profilePicOverride == ""
                                        ? user.data!.currentAvatarImageUrl
                                        : user.data!.profilePicOverride
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
                                  user.data!.userIcon == ""
                                      ? user.data!.currentAvatarThumbnailImageUrl
                                      : user.data!.userIcon
                              ),
                              radius: 60.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        user.data!.displayName,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color:Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user.data!.status.name + ": " + user.data!.statusDescription,
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
                          user.data!.bio,
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
                ),
                error: (error, _) => const Text("error"),
                loading: () => const CircularProgressIndicator()
            )
        )
    );
  }
}
