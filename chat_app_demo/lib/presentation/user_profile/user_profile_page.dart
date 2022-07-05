import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/user_profile/user_profile_cubit.dart';
import '../../constants.dart';
import '../../domain/auth/user.dart';
import '../../domain/user_profile/i_user_profile_repository.dart';
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

    return BlocProvider(
      create: (context) => UserProfileCubit(getIt<IUserProfileRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.emailAddress),
          centerTitle: true,
        ),
        body: UserProfileBody(
          user: isEditable ? currentUser : user,
          isEditable: isEditable,
        ),
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

  Widget _buildUserNameListTile() {
    // Text(user.imageUrl),
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
    // Text(user.imageUrl),
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

  Widget _buildUserProfileImage(BuildContext context, double imageHeight) {
    return SizedBox(
      height: imageHeight,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        user.imageUrl != '' ? user.imageUrl : defaultUserProfileImage,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double imageHeight = constraints.maxHeight * .5;
      return Column(
        children: [
          _buildUserProfileImage(context, imageHeight),
          SizedBox(
            height: constraints.maxHeight - imageHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    _buildUserNameListTile(),
                    _buildAboutMeListTile(),
                  ],
                ),
                Positioned(
                  top: -(64 / 2), // 64 is default fab size
                  right: 24,
                  child: FloatingActionButton(
                    child: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        context.read<UserProfileCubit>().cameraButtonPressed(
                              userId: user.userId,
                            ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
