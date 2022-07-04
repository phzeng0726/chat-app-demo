import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user_profile/user_profile_cubit.dart';

class UserNameBox extends StatelessWidget {
  const UserNameBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.user.userName,
          onChanged: (value) =>
              context.read<UserProfileCubit>().userNameChanged(value),
          autocorrect: false,
          autofocus: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.edit_note_rounded),
            // hintText: '請輸入要搜尋用戶的 Email 地址',
          ),
        );
      },
    );
  }
}
