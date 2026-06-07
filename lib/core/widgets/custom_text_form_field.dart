import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String?)?onSaved ;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final String? label;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.onSaved,
    this.maxLines,
    this.labelText,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(label!, style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.mainColor,fontWeight: FontWeight.w700)),
            ),
            SizedBox(width: 8),
            CircleAvatar(backgroundColor: Colors.red, radius: 2),
          ],
        ),
        if (label != null)
        SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          onSaved: onSaved,
          autovalidateMode: autoValidateMode,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(hintText: hintText, labelText: labelText),
        ),
      ],
    );
  }
}
