import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_image_picker.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/custom_is_featured.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/custom_is_organic.dart';

import '../../../../core/widgets/custom_sub_images.dart';
import '../view_model/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String name, code, description;
  late num price, expirationMonth, unitAmount, numberOfCalories;
  File? image;
  List<File>? subImagesFiles;
  bool isFeatured = false;
  bool isOrganic = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final expirationMonthController = TextEditingController();
  final unitAmountController = TextEditingController();
  final numberOfCaloriesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> categories = [
    const DropdownMenuItem(value: 'فواكه', child: Text('فواكه')),
    const DropdownMenuItem(value: 'خضروات', child: Text('خضروات')),
    const DropdownMenuItem(value: 'مشروبات', child: Text('مشروبات')),
    const DropdownMenuItem(value: 'مكسرات', child: Text('مكسرات')),
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return Stack(
          children: [
            Form(
              key: _formKey,
              autovalidateMode: autoValidateMode,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          CustomTextFormField(
                            controller: nameController,
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
                            controller: codeController,
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
                            controller: priceController,
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
                            controller: expirationMonthController,
                            hintText: 'تاريخ الانتهاء',
                            onSaved: (value) {
                              expirationMonth = num.parse(value!);
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
                            controller: unitAmountController,
                            hintText: 'عدد الوحدات',
                            onSaved: (value) {
                              unitAmount = num.parse(value!);
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
                            controller: numberOfCaloriesController,
                            hintText: 'عدد السعرات',
                            onSaved: (value) {
                              numberOfCalories = num.parse(value!);
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
                            controller: descriptionController,
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
                          DropdownButtonFormField<String>(
                            initialValue: selectedCategory,
                            hint: const Text('اختر التصنيف'),
                            items: categories,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'برجاء اختيار التصنيف';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              selectedCategory = value;
                            },
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الصوره الرئيسيه',
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(color: AppColor.mainColor),
                              ),
                              Text(
                                'اختر صوره واحده فقط لتكون الصوره الرئيسيه للمنتج',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(color: Color(0xff949D9E)),
                              ),
                              SizedBox(height: 10),
                              CustomImagePicker(
                                onImagePicked: (image) {
                                  this.image = image;
                                },
                              ),
                            ],
                          ),
                          CustomSubImages(
                            onImagesPicked: (images) {
                              subImagesFiles = images;
                              print(subImagesFiles!.length);
                            },
                          ),
                          CustomIsFeatured(
                            isFeatured: isFeatured,
                            onTap: () {
                              setState(() {});
                              isFeatured = !isFeatured;
                            },
                          ),
                          CustomIsOrganic(
                            isOrganic: isOrganic,
                            onTap: () {
                              setState(() {});
                              isOrganic = !isOrganic;
                            },
                          ),
                          CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                if (image != null && subImagesFiles != null) {
                                  if (selectedCategory != null) {
                                    ProductEntity addProductEntity =
                                        ProductEntity(
                                          name: name,
                                          code: code,
                                          price: price,
                                          description: description,
                                          imageFile: image!,
                                          isFeatured: isFeatured,
                                          expirationMonth: expirationMonth,
                                          unitAmount: unitAmount,
                                          numberOfCalories: numberOfCalories,
                                          isOrganic: isOrganic,
                                          subImagesFiles: subImagesFiles!,
                                          category: selectedCategory!,
                                          createdAt: DateTime.now()
                                              .toString()

                                        );
                                    context.read<AddProductCubit>().addProduct(
                                      addProductEntity,

                                    );
                                  } else {
                                    customShowSnakeBar(
                                      context,
                                      color: Colors.red,
                                      label: 'برجاء اختيار الصنف',
                                    );
                                  }
                                } else {
                                  customShowSnakeBar(
                                    context,
                                    color: Colors.red,
                                    label: 'برجاء ادخال صوره للمنتج',
                                  );
                                }
                                setState(() {
                                  autoValidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                            child: Text(
                              'اضافه المنتج ',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔒 Overlay وقت التحميل
            if (state is AddProductLoading)
              Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff1B5E37),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
