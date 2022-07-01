import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/home_cubit.dart';
import '../../../domain/auth/user.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';

class SearchUserOverview extends StatelessWidget {
  const SearchUserOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Expanded(
        child: ListView.builder(
          itemCount: state.searchUserList.length,
          itemBuilder: ((context, index) {
            User user = state.searchUserList[index];
            return ListTile(
              onTap: () => getIt<RootRouter>().push(
                ChatRoute(
                  otherUser: user,
                ),
              ),
              title: Text(user.userName),
            );
          }),
        ),
      );
    });
  }
}
