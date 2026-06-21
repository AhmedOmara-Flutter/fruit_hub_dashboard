
  import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';

  class CustomShowDialog {
    static Future<void> show(
        BuildContext context, {
          required String title,
          required Widget content,
          VoidCallback? cancel,
          VoidCallback? accept,
          Color color = AppColor.mainColor,
          IconData flag = Icons.payment_rounded,
        }) {
      return showDialog(
        context: context,
        useRootNavigator: true,
        barrierDismissible: true,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: const EdgeInsets.all(20),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: color.withOpacity(0.08),
                    child: Icon(
                      flag,
                      color: color,
                      size: 35,
                    ),
                  ),
            
                  const SizedBox(height: 20),
            
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: color,
                    ),
                  ),
            
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
                            elevation: 0,
                            side: BorderSide(
                              color: AppColor.mainColor.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            'إلغاء',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColor.mainColor,
                            ),
                          ),
                        ),
                      ),
            
                      const SizedBox(width: 10),
            
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                          ),
                          onPressed: accept,
                          child: Text(
                            'تأكيد',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
