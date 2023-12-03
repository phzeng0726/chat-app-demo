import 'package:flutter/material.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(context, "home.drawer.setting.title")),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              title: Text(tr(context, "home.drawer.setting.language")),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () =>
                  getIt<RootRouter>().push(const LangrageSelectRoute()),
            )
          ],
        ),
      ),
    );
  }
}
