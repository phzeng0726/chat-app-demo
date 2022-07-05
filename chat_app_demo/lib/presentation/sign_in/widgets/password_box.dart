import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/auth/sign_in_form/sign_in_form_cubit.dart';
import '../../../domain/auth/auth_validator.dart';

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
          validator: (input) => input!.isValidPassword(context),
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
            labelText: FlutterI18n.translate(context, "login.password"),
            hintText: FlutterI18n.translate(context, "login.passwordHint"),
          ),
        );
      },
    );
  }
}
