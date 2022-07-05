import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/user_profile/user_profile_cubit.dart';
import '../../domain/auth/user.dart';
import '../../domain/user_profile/i_user_profile_repository.dart';
import '../../injection.dart';
import 'widgets/user_profile_body.dart';

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
      create: (context) =>
          UserProfileCubit(getIt<IUserProfileRepository>())..init(user: user),
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
