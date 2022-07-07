import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

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
          title:
              Text(FlutterI18n.translate(context, "core.openGallery")),
          onTap: firstTileOnTap,
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: Text(FlutterI18n.translate(context, "core.openCamera")),
          onTap: secondTileOnTap,
        ),
      ],
    );
  }
}
