import 'package:flutter/material.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(context, "home.drawer.introduction.title")),
        centerTitle: true,
      ),
      body: Card(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/others/app_introduction.md'),
          builder: (context, snapshot) {
            return Markdown(
              data: snapshot.data.toString(),
              onTapLink: (String text, String? href, String title) =>
                  launchUrlString(href!),
            );
          },
        ),
      ),
    );
  }
}
