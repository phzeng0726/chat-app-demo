import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../../application/auth/register_form/register_form_cubit.dart';
import '../../../domain/auth/auth_validator.dart';

class PasswordBox extends StatelessWidget {
  const PasswordBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormCubit, RegisterFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password,
          onChanged: (value) =>
              context.read<RegisterFormCubit>().passwordChanged(value),
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
                  context.read<RegisterFormCubit>().passwordVisibleSwitched(),
              icon: state.isPWObscure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            labelText: tr(context, "auth.password"),
            hintText: tr(context, "auth.passwordHint"),
          ),
        );
      },
    );
  }
}
