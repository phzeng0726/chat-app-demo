import 'package:chat_app_demo/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAddressBox extends StatelessWidget {
  const EmailAddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormCubit, SignInFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.emailAddress,
          onChanged: (value) =>
              context.read<SignInFormCubit>().emailAddressChanged(value),
          autocorrect: false,
          autovalidateMode: state.validate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          validator: (value) {
            if (value == '') {
              return '帳號不能為空';
            }
            return null;
          },
          // obscureText: state.isPWObscure,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.assignment_ind),
            labelText: '帳號',
            hintText: '請輸入您的 Email 地址',
          ),
        );
      },
    );
  }
}
