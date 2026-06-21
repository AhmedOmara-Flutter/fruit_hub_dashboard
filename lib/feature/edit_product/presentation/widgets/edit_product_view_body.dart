import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/feature/edit_product/presentation/widgets/product_basic_info_section.dart';
import 'package:fruit_hub_dashboard/feature/edit_product/presentation/widgets/product_main_image_section.dart';
import 'package:fruit_hub_dashboard/feature/edit_product/presentation/widgets/product_pricing_section.dart';
import 'package:fruit_hub_dashboard/feature/edit_product/presentation/widgets/product_settings_section.dart';
import 'package:fruit_hub_dashboard/feature/edit_product/presentation/widgets/product_sub_images_section.dart';

import '../../../../core/cubit/products_cubit/update_product/update_product_cubit.dart';

class EditProductViewBody extends StatefulWidget {
  final ProductEntity product;

  const EditProductViewBody({super.key, required this.product});

  @override
  State<EditProductViewBody> createState() => _EditProductViewBodyState();
}

class _EditProductViewBodyState extends State<EditProductViewBody> {
  File? imageFile;
  String?image;
  List<File>? subImagesFiles;
  List<String>? subImages;
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
  void initState() {
    super.initState();
    final product = widget.product;
    nameController.text = product.name;
    codeController.text = product.code;
    priceController.text = product.price.toString();
    descriptionController.text = product.description;
    expirationMonthController.text = product.expirationMonth.toString();
    unitAmountController.text = product.unitAmount.toString();
    numberOfCaloriesController.text = product.numberOfCalories.toString();
    selectedCategory = product.category;
    isFeatured = product.isFeatured;
    isOrganic = product.isOrganic;
    image = product.image;
    subImages = product.subImages;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductCubit, UpdateProductState>(
      listener: (context, state) {
        if (state is UpdateProductError) {
          customShowSnakeBar(
              context, color: Colors.red, label: state.errMessage);
        }
        if (state is UpdateProductSuccess) {
          customShowSnakeBar(
              context, color: Colors.green, label: 'تم التعديل بنجاح');
          Future.delayed(const Duration(milliseconds: 300), () {
            if (context.mounted) {
              Navigator.pop(context);
            }
          });
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
                          ProductBasicInfoSection(
                            nameController: nameController,
                            codeController: codeController,
                            selectedCategory: selectedCategory,
                            categories: categories,
                            onCategoryChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                          ),
                          ProductPricingSection(
                            priceController: priceController,
                            expirationMonthController:
                            expirationMonthController,
                            unitAmountController: unitAmountController,
                            numberOfCaloriesController:
                            numberOfCaloriesController,
                          ),
                          ProductMainImageSection(
                            initialImage: widget.product.image,
                            onImagePicked: (imageFile) {
                              this.imageFile = imageFile;
                            },
                          ),
                          ProductSubImagesSection(
                            initialImages: widget.product.subImages,
                            onImagesPicked: (subImagesFiles) {
                              this.subImagesFiles = subImagesFiles;
                            },
                          ),
                          ProductSettingsSection(
                            descriptionController: descriptionController,
                            isFeatured: isFeatured,
                            isOrganic: isOrganic,
                            onFeaturedChanged: () {
                              setState(() {
                                isFeatured = !isFeatured;
                              });
                            },
                            onOrganicChanged: () {
                              setState(() {
                                isOrganic = !isOrganic;
                              });
                            },
                          ),
                          CustomButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                setState(() {
                                  autoValidateMode = AutovalidateMode.always;
                                });
                                return;
                              }

                              if (selectedCategory == null) {
                                customShowSnakeBar(
                                  context,
                                  color: Colors.red,
                                  label: 'برجاء اختيار التصنيف',
                                );
                                return;
                              }

                              final updatedProduct = widget.product.copyWith(
                                name: nameController.text.trim(),
                                code: codeController.text.trim().toLowerCase(),
                                price: num.tryParse(priceController.text) ?? 0,
                                description: descriptionController.text.trim(),
                                expirationMonth:
                                num.tryParse(expirationMonthController.text) ??
                                    0,
                                unitAmount:
                                num.tryParse(unitAmountController.text) ?? 0,
                                numberOfCalories:
                                num.tryParse(numberOfCaloriesController.text) ??
                                    0,
                                category: selectedCategory!,
                                isFeatured: isFeatured,
                                isOrganic: isOrganic,
                                imageFile: imageFile,
                                subImagesFiles: subImagesFiles,
                              );

                              context.read<UpdateProductCubit>().updateProduct(
                                updatedProduct,
                              );
                            },
                            child: Text(
                              'تعديل المنتج',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state is UpdateProductLoading)
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
