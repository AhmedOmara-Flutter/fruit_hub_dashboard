import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:image_picker/image_picker.dart';

import '../../generated/assets.dart';

class CustomImagePicker extends StatefulWidget {
  final ValueChanged<File?> onImagePicked;
  final String? initialImage;
  const CustomImagePicker({super.key, required this.onImagePicked, this.initialImage});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? imagePath;
  String? networkImage;

  @override
  void initState() {
    super.initState();
    networkImage = widget.initialImage;
  }
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
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xffF9FAFA),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Color(0xffE6E9EA)),
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: imagePath != null
                ? SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: Image.file(imagePath!),
            )
                : networkImage != null
                ? SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: Image.network(
                networkImage!,
                fit: BoxFit.cover,
              ),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Icon(
                  Icons.photo_outlined,
                  color: AppColor.mainColor,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  'اضغط لاضافه صوره',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.mainColor,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),          ),
          Visibility(
            visible: imagePath != null,
            child: IconButton(
              onPressed: () {
                imagePath = null;
                networkImage = null;
                widget.onImagePicked(null);
                setState(() {});
              },              icon: Icon(Icons.close, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
