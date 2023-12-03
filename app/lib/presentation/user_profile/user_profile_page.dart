import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/user_profile_edit/user_profile_edit_cubit.dart';
import '../../domain/auth/user.dart';
import 'widgets/user_profile_body.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  const UserProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileEditCubit, UserProfileEditState>(
      builder: (context, state) {
        final User currentUser =
            context.read<UserProfileEditCubit>().state.user;
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
      },
    );
  }
}
