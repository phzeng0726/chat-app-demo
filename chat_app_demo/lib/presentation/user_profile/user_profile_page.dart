import 'package:chat_app_demo/application/user_profile/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../constants.dart';
import '../../domain/auth/user.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';
import 'widgets/about_me_box.dart';
import 'widgets/user_name_box.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  const UserProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = context.watch<AuthCubit>().state.user;
    final bool isEditable = currentUser.userId == user.userId;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.emailAddress),
        centerTitle: true,
      ),
      body: UserProfileBody(
        user: isEditable ? currentUser : user,
        isEditable: isEditable,
      ),
    );
  }
}

class UserProfileBody extends StatelessWidget {
  final User user;
  final bool isEditable;
  const UserProfileBody({
    Key? key,
    required this.user,
    required this.isEditable,
  }) : super(key: key);

  Widget _buildUserProfilePhoto(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width,
      ),
      width: MediaQuery.of(context).size.width,
      child: Image(
        fit: BoxFit.contain,
        image: user.photoUrl != ''
            ? NetworkImage(user.photoUrl)
            : const NetworkImage(defaultUserProfileImage),
      ),
    );
  }

  Widget _buildUserNameListTile() {
    // Text(user.photoUrl),
    return ListTile(
      title: Text(user.userName),
      subtitle: const Text('使用者名稱'),
      onTap: isEditable
          ? () => getIt<RootRouter>().push(
                UserProfileEditRoute(
                  editItemTitle: '使用者名稱',
                  itemString: user.userName,
                  textFormFieldWidget: const UserNameBox(),
                ),
              )
          : null,
    );
  }

  Widget _buildAboutMeListTile() {
    // Text(user.photoUrl),
    return ListTile(
      title: Text(user.aboutMe == '' ? 'Bio' : user.aboutMe),
      subtitle: const Text('關於我'),
      onTap: isEditable
          ? () => getIt<RootRouter>().push(
                UserProfileEditRoute(
                  editItemTitle: '關於我',
                  itemString: user.aboutMe,
                  textFormFieldWidget: const AboutMeBox(),
                ),
              )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserProfilePhoto(context),
        _buildUserNameListTile(),
        _buildAboutMeListTile(),
        // ListTile(
        //   title: Text(user.phoneNumber),
        //   subtitle: const Text('手機號碼'),
        // ),
      ],
    );
  }
}
