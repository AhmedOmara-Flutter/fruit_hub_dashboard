import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لوحه التحكم', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1B5E37),
      ),
      body: AddProductViewBody(),
    );
  }
}
