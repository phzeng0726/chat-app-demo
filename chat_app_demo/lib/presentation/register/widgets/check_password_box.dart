// import 'package:chat_app_demo/domain/auth/auth_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../application/auth/register_form/register_form_cubit.dart';

// class CheckPasswordBox extends StatelessWidget {
//   const CheckPasswordBox({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterFormCubit, RegisterFormState>(
//       builder: (context, state) {
//         return TextFormField(
//           initialValue: state.checkPassword,
//           onChanged: (value) =>
//               context.read<RegisterFormCubit>().checkPasswordChanged(value),
//           autocorrect: false,
//           autovalidateMode: state.validate
//               ? AutovalidateMode.always
//               : AutovalidateMode.disabled,
//           validator: (input) {
//             if (input != state.password) {
//               return '確認密碼有誤';
//             }
//             input!.isValidPassword();
//           },
//           obscureText: true,
//           decoration: const InputDecoration(
//             prefixIcon: Icon(Icons.vpn_key),
//             labelText: '確認密碼',
//             hintText: '6 - 20 個英數字',
//           ),
//         );
//       },
//     );
//   }
// }
