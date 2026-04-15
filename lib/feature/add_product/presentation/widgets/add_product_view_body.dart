import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_image_picker.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/custom_is_featured.dart';

import '../view_model/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String name, code, description;
  late num price;
  File ?image;
  bool isFeatured = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 20,
                children: [
                  CustomTextFormField(
                    hintText: 'اسم المنتج',
                    onSaved: (value) {
                      name = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'كود المنتج',
                    onSaved: (value) {
                      code = value!.toLowerCase();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'سعر المنتج',
                    onSaved: (value) {
                      price = num.parse(value!);
                    },
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'وصف المنتج',
                    onSaved: (value) {
                      description = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الحقل مطلوب';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                  CustomImagePicker(
                    onImagePicked: (image) {
                      this.image = image;
                    },
                  ),
                  CustomIsFeatured(
                    isFeatured: isFeatured,
                    onTap: () {
                      setState(() {});
                      isFeatured = !isFeatured;
                    },
                  ),
                  BlocBuilder<AddProductCubit, AddProductState>(
                    builder: (context, state) {
                      return CustomButton(
                        child: Text(
                          'اضافه المنتج',
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelSmall,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (image == null) {
                              AddProductEntity addProductEntity = AddProductEntity(
                                name: name,
                                code: code,
                                price: price,
                                description: description,
                                imageFile: image!,
                                isFeatured: isFeatured,
                              );
                              context.read<AddProductCubit>().addProduct(addProductEntity);
                            } else {
                              customShowSnakeBar(context, color: Colors.red,
                                  label: 'برجاء ادخال صوره للمنتج');
                            }
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
