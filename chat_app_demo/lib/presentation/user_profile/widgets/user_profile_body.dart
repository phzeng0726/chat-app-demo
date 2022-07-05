import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user_profile/user_profile_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
import '../../../domain/user_profile/i_user_profile_repository.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';
import 'about_me_box.dart';
import 'user_name_box.dart';

class UserProfileBody extends StatelessWidget {
  final User user;
  final bool isEditable;

  const UserProfileBody({
    Key? key,
    required this.user,
    required this.isEditable,
  }) : super(key: key);

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

  Widget _buildUserNameListTile() {
    return ListTile(
      title: Text(user.userName),
      subtitle: const Text('暱稱'),
      onTap: isEditable
          ? () => getIt<RootRouter>().push(
                UserProfileEditRoute(
                  editItemTitle: '暱稱',
                  itemString: user.userName,
                  textFormFieldWidget: const UserNameBox(),
                ),
              )
          : null,
    );
  }

  Widget _buildAboutMeListTile() {
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
    Widget _buildImagePickBottomSheet() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('從相簿選取'),
            onTap: () {
              context.read<UserProfileCubit>().galleryButtonPressed(
                    userId: user.userId,
                  );
              context.router.pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('開啟相機'),
            onTap: () {
              context.read<UserProfileCubit>().cameraButtonPressed(
                    userId: user.userId,
                  );
              context.router.pop();
            },
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
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
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.9),
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return _buildImagePickBottomSheet();
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
