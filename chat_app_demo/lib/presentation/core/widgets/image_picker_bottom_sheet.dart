import 'package:flutter/material.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final void Function()? firstTileOnTap;
  final void Function()? secondTileOnTap;
  const ImagePickerBottomSheet({
    Key? key,
    required this.firstTileOnTap,
    required this.secondTileOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.photo),
          title: Text(tr(context, "core.openGallery")),
          onTap: firstTileOnTap,
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: Text(tr(context, "core.openCamera")),
          onTap: secondTileOnTap,
        ),
      ],
    );
  }
}
