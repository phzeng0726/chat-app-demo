import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../domain/auth/user.dart';

class UserProfileAvater extends StatelessWidget {
  final User user;
  const UserProfileAvater({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundImage: user.photoUrl != ''
          ? NetworkImage(user.photoUrl)
          : const NetworkImage(defaultUserProfileImage),
      backgroundColor: Colors.transparent,
    );
  }
}
