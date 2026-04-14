import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final ValueChanged<File?> onImagePicked;
  const CustomImagePicker({super.key, required this.onImagePicked});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final ImagePicker picker = ImagePicker();
          final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
          );
          if (image != null) {
            setState(() {
              imagePath = File(image.path);
              widget.onImagePicked(imagePath!);
            });
          }
        } on Exception catch (e) {
          print(e);
        }
      },
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.6,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: imagePath != null
                ? Image.file(imagePath!)
                : Icon(
                    Icons.photo_camera_back_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
          ),
          Visibility(
            visible: imagePath != null,
            child: IconButton(
              onPressed: () {
                imagePath = null;
                widget.onImagePicked(null);
                setState(() {});
              },
              icon: Icon(Icons.close, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
