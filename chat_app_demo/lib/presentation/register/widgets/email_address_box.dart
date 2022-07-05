import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/register_form/register_form_cubit.dart';
import '../../../domain/auth/auth_validator.dart';

// TODO: [雙語]
class EmailAddressBox extends StatelessWidget {
  const EmailAddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormCubit, RegisterFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.emailAddress,
          onChanged: (value) =>
              context.read<RegisterFormCubit>().emailAddressChanged(value),
          autocorrect: false,
          autovalidateMode: state.validate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          validator: (input) => input!.isValidEmail(context),
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
