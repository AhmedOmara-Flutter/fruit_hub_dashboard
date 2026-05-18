
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  const CustomTextField({super.key,  this.readOnly=false, this.onTap, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: 'ابحث عن...',
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.mainColor.withOpacity(0.3),
          ),

          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(
              Icons.filter_list_sharp
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color:  Colors.grey.shade200
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(
                color:  Colors.grey.shade200
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(
                color:   Colors.grey.shade200
            ),
          ),
        ),
      ),
    );
  }
}
