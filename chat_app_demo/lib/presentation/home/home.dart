import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/home/home_cubit.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../domain/core/load_status.dart';
import '../../injection.dart';
import 'widgets/search_user_box.dart';
import 'widgets/search_user_overview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<IChatRepository>()),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Chat App Demo'),
            centerTitle: true,
            actions: [
              ElevatedButton(
                onPressed: () => context.read<AuthCubit>().signedOut(),
                child: const Text('登出'),
              )
            ]),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                const SearchUserBox(),
                if (state.searchStatus == const LoadStatus.initial()) ...[
                  const Text('聊天列表'),
                ] else if (state.searchStatus == const LoadStatus.failed()) ...[
                  const Text('查無用戶'),
                ] else ...[
                  const SearchUserOverview(),
                ],
//                 ElevatedButton(
//                   onPressed: () async {
//                     /// Create a storage reference from our app
//                     final storageRef = FirebaseStorage.instance.ref();

// // Create a reference to "mountains.jpg"
//                     final mountainsRef = storageRef.child("mountains.jpg");

// // Create a reference to 'images/mountains.jpg'
//                     final mountainImagesRef =
//                         storageRef.child("images/mountains.jpg");

// // While the file names are the same, the references point to different files
//                     assert(mountainsRef.name == mountainImagesRef.name);
//                     assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
//                     Directory appDocDir = await getApplicationDocumentsDirectory();

//                   },
//                   child: Text('測試'),
//                 ),
              ],
            );
          },
        ),
      ),
    );
  }
}
