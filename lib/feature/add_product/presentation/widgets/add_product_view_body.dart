import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_image_picker.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/background_card.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/custom_is_featured.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/custom_is_organic.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/view_model/my_products_cubit.dart';

import '../../../../core/widgets/custom_sub_images.dart';
import '../../../main/presentation/view_model/main_cubit.dart';
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
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          customShowSnakeBar(
              context, color: Colors.red, label: state.errMessage);
        }
        if (state is AddProductSuccess) {
          clearForm();
          context.read<MainCubit>().changeIndex(0);
          customShowSnakeBar(
              context, color: Colors.green, label: 'تم الاضافه بنجاح');
        }
      },

      builder: (context, state) {
        return Stack(
          children: [
            Form(
              key: _formKey,
              autovalidateMode: autoValidateMode,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          BackgroundCard(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          label: 'اسم المنتج',
                                          controller: nameController,
                                          hintText: 'اكتب اسم المنتج',
                                          onSaved: (value) {
                                            name = value!;
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الحقل مطلوب';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: CustomTextFormField(
                                          label: 'كود المنتج',
                                          controller: codeController,
                                          hintText: 'اكتب كود المنتج',
                                          onSaved: (value) {
                                            code = value!.toLowerCase();
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الحقل مطلوب';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .start,
                                    children: [
                                      Text('التصنيف', style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                          color: AppColor.mainColor,
                                          fontWeight: FontWeight.w700)),
                                      SizedBox(width: 8),
                                      CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 2),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    initialValue: selectedCategory,
                                    hint: Text('اختر التصنيف', style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleSmall,),
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
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            icon: Icons.local_offer_outlined,
                            label: 'معلومات المنتج',
                            subLabel: 'البيانات الاساسيه للمنتج',
                          ),
                          BackgroundCard(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          label: 'سعر المنتج',
                                          controller: priceController,
                                          hintText: 'اكتب سعر المنتج',
                                          onSaved: (value) {
                                            price = num.parse(value!);
                                          },
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الحقل مطلوب';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: CustomTextFormField(
                                          label:'تاريخ الانتهاء' ,
                                          controller: expirationMonthController,
                                          hintText: 'اكتب تاريخ الانتهاء',
                                          onSaved: (value) {
                                            expirationMonth = num.parse(value!);
                                          },
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الحقل مطلوب';
                                            }
                                            return null;
                                          },
                                        ),

                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          label: 'عدد الوحدات',
                                          controller: unitAmountController,
                                          hintText: 'اكتب عدد الوحدات',
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
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: CustomTextFormField(
                                          label: 'عدد السعرات',
                                          controller: numberOfCaloriesController,
                                          hintText: 'اكتب عدد السعرات',
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            icon: CupertinoIcons.cart,
                            label: 'التسعير والمخزون',
                            subLabel: 'السعر والكميه والقيم الغذائيه للمنتج',
                          ),
                          BackgroundCard(
                            label:'الصوره الرئيسيه' ,
                            icon: Icons.image_outlined,
                            subLabel: 'اختر صوره واحده فقط لتكون الصوره الرئيسيه للمنتج',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: CustomImagePicker(
                                    onImagePicked: (image) {
                                      this.image = image;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BackgroundCard(
                            icon: Icons.photo_library_outlined,
                            label: 'صور المنتج',
                            subLabel:  'يمكنك اضافه اكثر من صوره للمنتج (4 صور فقط)',
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: CustomSubImages(
                                onImagesPicked: (images) {
                                  subImagesFiles = images;
                                  print(subImagesFiles!.length);
                                },
                              ),
                            ),
                          ),
                          BackgroundCard(
                            icon: Icons.settings_outlined,
                            label:'اعدادات اضافيه' ,
                            subLabel:'خصائص ومميزات المنتج',
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    controller: descriptionController,
                                    label: 'وصف المنتج',
                                    hintText: 'اكتب وصف المنتج',
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
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomIsFeatured(
                                          isFeatured: isFeatured,
                                          onTap: () {
                                            setState(() {});
                                            isFeatured = !isFeatured;
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomIsOrganic(
                                          isOrganic: isOrganic,
                                          onTap: () {
                                            setState(() {});
                                            isOrganic = !isOrganic;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
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
                                              .toString(),

                                        );
                                    context.read<AddProductCubit>().addProduct(
                                      addProductEntity,);
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

  void clearForm() {
    print('before: ${nameController.text}');
    setState(() {
      nameController.clear();
    codeController.clear();
    priceController.clear();
    descriptionController.clear();
    expirationMonthController.clear();
    unitAmountController.clear();
    numberOfCaloriesController.clear();
    print('after: ${nameController.text}');
     image = null;
      subImagesFiles = null;
      selectedCategory = null;
      isFeatured = false;
      isOrganic = false;
      autoValidateMode = AutovalidateMode.disabled;
    });

    _formKey.currentState?.reset();
  }

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    expirationMonthController.dispose();
    unitAmountController.dispose();
    numberOfCaloriesController.dispose();
    super.dispose();
  }
}

