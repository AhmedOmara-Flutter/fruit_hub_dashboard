import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/category_tabs.dart';

class MyProductsViewBody extends StatelessWidget{
  const MyProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        CustomTextField(onChanged: (value) {}),
        Expanded(child: CategoryTabs()),
      ],
    );
  }
}
