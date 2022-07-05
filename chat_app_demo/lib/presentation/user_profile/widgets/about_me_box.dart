import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user_profile_edit/user_profile_edit_cubit.dart';


class AboutMeBox extends StatelessWidget {
  const AboutMeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileEditCubit, UserProfileEditState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.user.aboutMe,
          onChanged: (value) =>
              context.read<UserProfileEditCubit>().aboutMeChanged(value),
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
