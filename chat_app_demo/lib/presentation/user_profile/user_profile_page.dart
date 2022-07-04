import 'package:chat_app_demo/injection.dart';
import 'package:chat_app_demo/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/chat/chat_cubit.dart';
import '../../constants.dart';
import '../../domain/auth/user.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  const UserProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  Widget _buildUserProfilePhoto(BuildContext context) {
    // Text(user.photoUrl),

    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Image(
          image: user.photoUrl != ''
              ? NetworkImage(user.photoUrl)
              : const NetworkImage(defaultUserProfileImage),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ListTile(
            title: Text(user.userName),
            subtitle: const Text('使用者名稱'),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.userName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildUserProfilePhoto(context),
          ListTile(
            title: Text(user.emailAddress),
            subtitle: const Text('電子郵箱'),
          ),
          ListTile(
            title: Text(user.userName),
            subtitle: const Text('使用者名稱'),
          ),
          ListTile(
            title: Text(user.aboutMe == '' ? 'Bio' : user.aboutMe),
            subtitle: const Text('關於我'),
            onTap: () => getIt<RootRouter>().push(
              UserProfileEditRoute(
                  editItemTitle: '關於我',
                  itemString: user.aboutMe,
                  textFormField: TextFormField()),
            ),
          ),
          // ListTile(
          //   title: Text(user.phoneNumber),
          //   subtitle: const Text('手機號碼'),
          // ),
        ],
      ),
    );
  }
}
