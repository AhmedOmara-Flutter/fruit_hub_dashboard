import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../add_product/domain/entities/product_entity.dart';

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
    });  }
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

              buildDatePickerTile(
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

              buildDatePickerTile(
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:canSave?() {
                    if (_formKey.currentState!.validate()) {
                      final discount =
                      double.parse(discountController.text);

                      // cubit.addOffer(
                      //   productId: widget.productId,
                      //   discountPercentage: discount,
                      //   expiresAt: expiresAt,
                      // );

                      Navigator.pop(context);
                    }
                  }:null,
                  child: Text(
                    'حفظ العرض',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildDatePickerTile({
    required String title,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColor.mainColor.withOpacity(.3),
          ),
          color: Colors.grey.shade50,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.mainColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.calendar_month_rounded,
                color: AppColor.mainColor,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date == null
                        ? 'اختر التاريخ'
                        : '${date.day}/${date.month}/${date.year}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}
