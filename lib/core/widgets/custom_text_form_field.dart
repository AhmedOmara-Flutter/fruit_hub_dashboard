import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String?)?onSaved ;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction, this.onSaved, this.maxLines, this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onSaved: onSaved,
      autovalidateMode: autoValidateMode,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hintText,labelText: labelText),
    );
  }
}
