
  import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';

customShowDialog(
  BuildContext context, {
  required String title,
  required Widget content,
  void Function()? cancel,
  void Function()? accept,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColor.mainColor.withOpacity(0.08),
              child: const Icon(
                Icons.payment_rounded,
                color: AppColor.mainColor,
                size: 35,
              ),
            ),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 10),
            content,
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: cancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onLongPress: () {},
                    child: Text(
                      'إلغاء',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: accept,
                    child: Text(
                      'تأكيد',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
