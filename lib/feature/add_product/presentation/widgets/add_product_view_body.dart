import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_image_picker.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/background_card.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/custom_is_featured.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/custom_is_organic.dart';
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
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> categories = [
    const DropdownMenuItem(value: 'بيتزا', child: Text('بيتزا')),
    const DropdownMenuItem(value: 'كريب لحوم', child: Text('كريب لحوم')),
    const DropdownMenuItem(value: 'كريب دجاج', child: Text('كريب دجاج')),
    const DropdownMenuItem(value: 'سندوتشات سوري', child: Text('سندوتشات سوري')),
    const DropdownMenuItem(value: 'مكرونات', child: Text('مكرونات')),
    const DropdownMenuItem(value: 'مشويات', child: Text('مشويات')),
    const DropdownMenuItem(value: 'حواوشي ايطالي', child: Text('حواوشي ايطالي')),
    const DropdownMenuItem(value: 'برجر', child: Text('برجر')),
    const DropdownMenuItem(value: 'فطائر', child: Text('فطائر')),
    const DropdownMenuItem(value: 'اضافات', child: Text('اضافات')),
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
          context.read<MainCubit>().changeIndex(0);
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
                            label: 'معلومات المنتج',
                            subLabel: 'البيانات الاساسيه للمنتج',
                            icon: Icons.local_offer_outlined,
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
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
                                            if (value == null || value.isEmpty) {
                                              return 'الحقل مطلوب';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                        child: CustomTextFormField(
                                          label: 'سعر المنتج',
                                          controller: priceController,
                                          hintText: 'اكتب سعر المنتج',
                                          keyboardType: TextInputType.number,
                                          onSaved: (value) {
                                            price = num.parse(value!);
                                          },
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

                                  SizedBox(height: 10.h),

                                  Row(
                                    children: [
                                      Text(
                                        'التصنيف',
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          color: AppColor.mainColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      CircleAvatar(
                                        backgroundColor: AppColor.red,
                                        radius: 2.r,
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 8.h),

                                  DropdownButtonFormField<String>(
                                    initialValue: selectedCategory,
                                    hint: Text(
                                      'اختر التصنيف',
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        color: AppColor.textSecondary,
                                      ),
                                    ),
                                    items: categories,
                                    dropdownColor: AppColor.card,
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: AppColor.textPrimary,
                                    ),
                                    decoration: InputDecoration(
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

                                  SizedBox(height: 10.h),
                                ],
                              ),
                            ),
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
                                      code: DateTime
                                          .now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      price: price,
                                      description: description,
                                      imageFile: image!,
                                      isFeatured: isFeatured,
                                      expirationMonth: 2,
                                      unitAmount: 100,
                                      numberOfCalories: 100,
                                      isOrganic: true,
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
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state is AddProductLoading)
              Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.mainColor,
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
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

