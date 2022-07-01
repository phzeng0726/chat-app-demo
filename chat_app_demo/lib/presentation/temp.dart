import 'package:flutter/material.dart';
// https://stackoverflow.com/questions/66201124/right-aligning-message-timestamp-with-trailing-right-hand-side-of-flutter-messag/66365293#66365293
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    final timeStamp = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.access_time),
        Text('10:10'),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                maxLines: 5,
                onChanged: (text) {
                  setState(() {
                    message = text;
                  });
                },
              ),
              SizedBox(height: 30),
              Center(
                child: MessageBox(
                  message,
                  timeStamp: timeStamp,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox(this.message, {required this.timeStamp, Key? key}) : super(key: key);

  final String message;

  final Widget timeStamp;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildText(message, TextStyle(fontSize: 20), '            \u202F'),
        Positioned.fill(
          child: Align(alignment: Alignment.bottomRight, child: timeStamp),
        ),
      ],
    );
  }

  Widget _buildText(String text, TextStyle style, String reserve) {
    return Container(
      color: Colors.grey.shade200,
      constraints: BoxConstraints(
        minWidth: 60,
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          final originalPainter = TextPainter(
            text: TextSpan(text: message, style: style),
            textDirection: TextDirection.ltr,
            textWidthBasis: TextWidthBasis.longestLine,
          )..layout(maxWidth: constraints.maxWidth);

          final reservePainter = TextPainter(
            text: TextSpan(text: message + reserve, style: style),
            textDirection: TextDirection.ltr,
            textWidthBasis: TextWidthBasis.longestLine,
          )..layout(maxWidth: constraints.maxWidth);

          final changeLine =
              reservePainter.width > originalPainter.width + 0.001 ||
                  reservePainter.height > originalPainter.height + 0.001;

          return Text(
            changeLine ? message + '\n' : message,
            style: style,
          );
        },
      ),
    );
  }
}
