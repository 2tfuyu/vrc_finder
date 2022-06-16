import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrc_finder/model/api/vrc_api.dart';
import 'package:vrc_finder/model/login_notifier.dart';
import 'package:vrc_finder/presentation/friend_location/friend_location_page.dart';
import 'package:vrc_finder/router.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  ref.watch(emailProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  ref.watch(passwordProvider.notifier).state = value;
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(ref.watch(toastTextProvider)),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  child: const Text('ログイン'),
                  onPressed: () async {
                    try {
                      final auth = ref.watch(authApiProvider).value!;
                      final response = await auth.login(username: email, password: password);
                      if (response.requiresTwoFactorAuth) {
                        //
                      }
                      if (response.error != null) {
                        throw Exception(response.error);
                      }
                      if (auth.currentUser != null) {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context) => const FriendLocationPage()
                        ), (route) => false);
                      }
                    }
                    catch (e) {
                      ref.watch(toastTextProvider.notifier).state = "ログインに失敗しました ${e.toString()}";
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}