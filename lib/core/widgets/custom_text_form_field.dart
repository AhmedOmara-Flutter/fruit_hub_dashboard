import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final String? label;
  final bool readOnly;

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
    this.readOnly = false,
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
                padding: EdgeInsets.only(right: 5.w),
                child: Text(
                  label!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              CircleAvatar(
                backgroundColor: AppColor.red,
                radius: 2.r,
              ),
            ],
          ),
        if (label != null) SizedBox(height: 8.h),
        TextFormField(
          readOnly: readOnly,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColor.textPrimary,
          ),
          maxLines: maxLines,
          onSaved: onSaved,
          autovalidateMode: autoValidateMode,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            hintStyle: TextStyle(
              color: AppColor.textSecondary,
              fontSize: 14.sp,
            ),
            labelStyle: TextStyle(
              color: AppColor.textSecondary,
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: AppColor.card,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.mainColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}