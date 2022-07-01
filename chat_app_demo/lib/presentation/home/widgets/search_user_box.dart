import 'package:chat_app_demo/application/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUserBox extends StatelessWidget {
  const SearchUserBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.emailAddress,
          onChanged: (value) =>
              context.read<HomeCubit>().searchUserChanged(value),
          autocorrect: false,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: '請輸入要搜尋用戶的 Email 地址',
          ),
          onEditingComplete: () =>
              context.read<HomeCubit>().searchUserStarted(),
        );
      },
    );
  }
}
