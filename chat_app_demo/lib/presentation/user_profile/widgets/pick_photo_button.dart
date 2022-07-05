import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class PickPhotoButton extends StatefulWidget {
  const PickPhotoButton({Key? key}) : super(key: key);

  @override
  State<PickPhotoButton> createState() => _PickPhotoButtonState();
}

class _PickPhotoButtonState extends State<PickPhotoButton> {
  // Image Picker
  List<File> _images = [];
  File? _image; // Used only if you need a single picture

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    PickedFile? pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = await picker.getImage(
        source: ImageSource.camera,
      );
    }

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
        //_image = File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.add_photo_alternate_rounded,
        color: Colors.white,
      ),
      onPressed: () async {
        await getImage(true);
      },
    );
  }
}
