import 'package:chat_app_demo/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordBox extends StatelessWidget {
  const PasswordBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormCubit, SignInFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password,
          onChanged: (value) =>
              context.read<SignInFormCubit>().passwordChanged(value),
          autocorrect: false,
          autovalidateMode: state.validate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          validator: (value) {
            if (value == '' || value!.length < 6) {
              return '密碼長度過短';
            }
            return null;
          },
          obscureText: state.isPWObscure,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            suffixIcon: IconButton(
              onPressed: () =>
                  context.read<SignInFormCubit>().passwordVisibleSwitched(),
              icon: state.isPWObscure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            labelText: '密碼',
            hintText: '6 - 20 個英數字',
          ),
        );
      },
    );
  }
}
