import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/auth/sign_in_form/sign_in_form_cubit.dart';
import '../../../domain/auth/auth_validator.dart';

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
          validator: (input) => input!.isValidEmail(context),
          // obscureText: state.isPWObscure,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.assignment_ind),
            labelText: FlutterI18n.translate(context, "login.emailAddress"),
            hintText: FlutterI18n.translate(context, "login.emailAddressHint"),
          ),
        );
      },
    );
  }
}
