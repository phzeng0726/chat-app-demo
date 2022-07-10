import 'package:flutter/material.dart';

import '../../../domain/auth/user.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';

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
            : const AssetImage('assets/images/blank_profile_picture.png')
                as ImageProvider,
        backgroundColor: Colors.transparent,
      ),
      onTap: () => getIt<RootRouter>().push(UserProfileRoute(user: user)),
    );
  }
}
