import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/build_date_picker_tile.dart';
import 'package:fruit_hub_dashboard/feature/offers/domain/entities/offer_entity.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../offers/presentation/view_model/offers_cubit.dart';

class AddOfferBottomSheet extends StatefulWidget {
  final ProductEntity product;

  const AddOfferBottomSheet({
    super.key,
    required this.product,
  });

  @override
  State<AddOfferBottomSheet> createState() => _AddOfferBottomSheetState();
}

class _AddOfferBottomSheetState extends State<AddOfferBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController priceBeforeDiscount = TextEditingController();
  final TextEditingController priceAfterDiscount = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  bool get canSave =>
      discountController.text.isNotEmpty &&
          startDate != null &&
          endDate != null &&
          !endDate!.isBefore(startDate!);

  @override
  void initState() {
    super.initState();
    priceBeforeDiscount.text = widget.product.price.toString();
    priceAfterDiscount.text = widget.product.price.toString();
    discountController.addListener(() {
      final discount = double.tryParse(discountController.text) ?? 0;
      final result = widget.product.price -
          (widget.product.price * discount / 100);
      priceAfterDiscount.text = result % 1 == 0
          ? result.toInt().toString()
          : result.toStringAsFixed(2);
    });
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 11,
          bottom: MediaQuery.of(context).viewInsets.bottom+20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'إضافة عرض جديد',
                  style:Theme.of(context).textTheme.displaySmall
              ),

              const SizedBox(height: 15),

              CustomTextFormField(
                controller: discountController,
                keyboardType: TextInputType.number,
                hintText:  'ادخل نسبة الخصم (%)',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ادخل نسبة الخصم';
                  }

                  final discount = double.tryParse(value);

                  if (discount == null) {
                    return 'قيمة غير صحيحة';
                  }

                  if (discount <= 0 || discount > 100) {
                    return 'يجب أن تكون بين 1 و 100';
                  }

                  return null;
                },
                label: 'نسبة الخصم (%)',
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                        readOnly: true,
                        controller: priceBeforeDiscount,
                        keyboardType: TextInputType.number,
                        hintText:  'السعر قبل الخصم',
                        label:  'السعر قبل الخصم'
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                        readOnly: true,
                        controller:priceAfterDiscount,
                        keyboardType: TextInputType.number,
                        hintText:  'السعر بعد الخصم',
                        label:  'السعر بعد الخصم'
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              BuildDatePickerTile(
                title: 'تاريخ بداية العرض',
                date: startDate,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      startDate = pickedDate;
                    });
                  }
                },
              ),

              const SizedBox(height: 12),

              BuildDatePickerTile(
                title: 'تاريخ انتهاء العرض',
                date: endDate,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      endDate = pickedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              BlocConsumer<OffersCubit, OfferState>(
                  listener: (context, state) {
                    print(state.runtimeType);

                    if (state is OffersFailure) {
                      customShowSnakeBar(
                        context,
                        color: Colors.red,
                        label: state.errMessage,
                      );
                    }

                    if (state is OffersSuccess) {
                      print('SUCCESS');

                      Navigator.pop(context);

                      customShowSnakeBar(
                        context,
                        color: AppColor.mainColor,
                        label: 'تم حفظ العرض بنجاح',
                      );
                    }
                  },
                builder: (context, state) {
                  return state is OffersLoading == true
                      ? CircularProgressIndicator(color: AppColor.mainColor,)
                      : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: canSave ? () async {
                        if (_formKey.currentState!.validate()) {
                          OfferEntity offer = OfferEntity(
                            productId: widget.product.id!,
                            discountPercentage: double.parse(discountController
                                .text),

                            startDate: startDate ?? DateTime.now(),
                            endDate: endDate ?? DateTime.now(),
                            image: widget.product.image ?? "",
                            name: widget.product.name,
                            priceBeforeDiscount: double.parse(
                                priceBeforeDiscount
                                    .text),
                            priceAfterDiscount: double.parse(priceAfterDiscount
                                .text),
                          );
                          await context.read<OffersCubit>().addOffer(offer);
                        }
                      } : null,
                      child: Text(
                        'حفظ العرض',
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelSmall,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    discountController.dispose();
    priceBeforeDiscount.dispose();
    priceAfterDiscount.dispose();
    super.dispose();
  }
}

