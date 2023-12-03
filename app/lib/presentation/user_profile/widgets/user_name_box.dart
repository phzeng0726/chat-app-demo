import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user_profile_edit/user_profile_edit_cubit.dart';

class UserNameBox extends StatelessWidget {
  const UserNameBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileEditCubit, UserProfileEditState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.user.userName,
          onChanged: (value) =>
              context.read<UserProfileEditCubit>().userNameChanged(value),
          autocorrect: false,
          autofocus: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.edit_note_rounded),
          ),
        );
      },
    );
  }
}
