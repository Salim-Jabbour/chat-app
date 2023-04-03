import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({required this.imagePickerFn, super.key});

  final void Function(io.File? pickedImage) imagePickerFn;
  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  io.File? image;

  Future<void> _imagePicker(ImageSource s) async {
    var imagePath = await ImagePicker().pickImage(
      source: s,
      imageQuality: 50,
      maxWidth: 300,
    );
    setState(() {
      image = io.File(imagePath!.path);
    });
    widget.imagePickerFn(image);
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                _imagePicker(ImageSource.gallery);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.image,
                size: 25,
              ),
              label: const Text(
                'Add Image from Gallery',
                style: TextStyle(fontSize: 18),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                _imagePicker(ImageSource.camera);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                size: 25,
              ),
              label: const Text(
                'Add Image from Camera',
                style: TextStyle(fontSize: 18),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: image != null ? FileImage(image!) : null,
          backgroundColor: Colors.grey,
        ),
        TextButton.icon(
          onPressed: _modalBottomSheetMenu,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
