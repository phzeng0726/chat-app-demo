import 'package:flutter/material.dart';

class UserProfileEditPage extends StatelessWidget {
  final String editItemTitle;
  final String itemString;
  final TextFormField textFormField;
  const UserProfileEditPage({
    Key? key,
    required this.editItemTitle,
    required this.itemString,
    required this.textFormField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editItemTitle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          textFormField,
        ],
      ),
    );
  }
}
