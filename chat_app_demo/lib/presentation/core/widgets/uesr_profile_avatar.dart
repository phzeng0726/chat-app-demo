import 'package:chat_app_demo/injection.dart';
import 'package:chat_app_demo/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../domain/auth/user.dart';

class UserProfileAvatar extends StatelessWidget {
  final User user;
  const UserProfileAvatar({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CircleAvatar(
        radius: 30.0,
        backgroundImage: user.imageUrl != ''
            ? NetworkImage(user.imageUrl)
            : const NetworkImage(defaultUserProfileImage),
        backgroundColor: Colors.transparent,
      ),
      onTap: () => getIt<RootRouter>().push(UserProfileRoute(user: user)),
    );
  }
}
