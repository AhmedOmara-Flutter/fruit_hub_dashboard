import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_color.dart';

class CustomSubImages extends StatefulWidget {
  final ValueChanged<List<File>> onImagesPicked;

  const CustomSubImages({
    super.key,
    required this.onImagesPicked,
  });

  @override
  State<CustomSubImages> createState() => _CustomSubImagesState();
}

class _CustomSubImagesState extends State<CustomSubImages> {
  final List<File> images = [];

  Future<void> pickImages() async {
    try {
      final ImagePicker picker = ImagePicker();

      final List<XFile> pickedImages =
      await picker.pickMultiImage();

      if (pickedImages.isEmpty) return;

      final int remaining = 4 - images.length;

      if (remaining <= 0) return;

      final selectedImages = pickedImages.take(remaining);

      images.addAll(
        selectedImages.map(
              (e) => File(e.path),
        ),
      );

      widget.onImagesPicked(images);

      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void removeImage(int index) {
    images.removeAt(index);

    widget.onImagesPicked(images);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final bool hasImage = index < images.length;
        return hasImage
            ? Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(12),
                child: Image.file(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 6,
              right: 6,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    removeImage(index);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        )
            : GestureDetector(
          onTap: pickImages,
          child: DottedBorder(
            color: Colors.grey,
            strokeWidth: 2,
            dashPattern: const [8, 4],
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF9FAFA),
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: AppColor.mainColor,
                    size: 35,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'اضافه صورة',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      color:
                      AppColor.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}