import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/user_profile_edit/user_profile_edit_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
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

  Widget _buildUserNameListTile(BuildContext context) {
    return ListTile(
      title: Text(user.userName),
      subtitle: Text(FlutterI18n.translate(context, "userProfile.userName")),
      onTap: isEditable
          ? () => getIt<RootRouter>().push(
                UserProfileEditRoute(
                  editItemTitle: FlutterI18n.translate(
                      context, "userProfile.userNameTitle"),
                  itemString: user.userName,
                  textFormFieldWidget: const UserNameBox(),
                ),
              )
          : null,
    );
  }

  Widget _buildAboutMeListTile(BuildContext context) {
    return ListTile(
      title: Text(user.aboutMe == '' ? 'Bio' : user.aboutMe),
      subtitle: Text(FlutterI18n.translate(context, "userProfile.aboutMe")),
      onTap: isEditable
          ? () => getIt<RootRouter>().push(
                UserProfileEditRoute(
                  editItemTitle: FlutterI18n.translate(
                      context, "userProfile.aboutMeTitle"),
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
            title:
                Text(FlutterI18n.translate(context, "userProfile.openGallery")),
            onTap: () {
              context.read<UserProfileEditCubit>().galleryButtonPressed(
                    userId: user.userId,
                  );
              context.router.pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title:
                Text(FlutterI18n.translate(context, "userProfile.openCamera")),
            onTap: () {
              context.read<UserProfileEditCubit>().cameraButtonPressed(
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
                      _buildUserNameListTile(context),
                      _buildAboutMeListTile(context),
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
