import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/models/order_model.dart';

class PrinterService {
  PrinterService._();

  static final instance = PrinterService._();

  Future<void> printOrder(OrderModel order) async {
    final temp = await getTemporaryDirectory();

    final jsonFile = File("${temp.path}/order.json");

    final json = {
      "OrderNumber": order.id ?? "",
      "CustomerName": order.userModel.userName,
      "Phone": order.userModel.phone,
      "Total": order.totalPrice,
      "Items": order.items
          .map(
            (e) => {
          "Name": e.name,
          "Quantity": e.quantity,
          "Price": e.unitPrice,
        },
      )
          .toList(),
    };

    await jsonFile.writeAsString(jsonEncode(json));

    final exe = File("printer/PrintService.exe");

    if (!exe.existsSync()) {
      throw Exception("PrintService.exe not found");
    }

    final result = await Process.run(
      exe.path,
      [jsonFile.path],
    );

    if (result.exitCode != 0) {
      throw Exception(result.stderr.toString());
    }

    debugPrint(result.stdout.toString());
  }
}