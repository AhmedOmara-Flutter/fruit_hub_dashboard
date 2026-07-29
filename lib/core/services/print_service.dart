import 'dart:convert';
import 'dart:io';

import '../entities/order_entity.dart';

class PrintService {
  static Future<void> printOrder(OrderEntity order) async {
    final subTotal = order.cartEntity.getTotalPrice();
    final shipping = order.selectedLocationEntity?.cost ?? 0.0;
    final total = subTotal + shipping;

    final json = {
      "OrderNumber": order.id ?? "",
      "CustomerName": order.userEntity?.userName ?? "",
      "Phone": order.userEntity?.phone ?? "",

      "Address": order.addressEntity?.address ?? "",
      "DeliveryArea": order.selectedLocationEntity?.title ?? "",

      "SubTotal": subTotal,
      "Shipping": shipping,
      "Total": total,

      "OrderNote": order.orderNote ?? "",

      "PaymentMethod":
      (order.isCashOnDelivery ?? true) ? "Cash" : "Online",

      "Items": order.cartEntity.cartItems
          .map((e) => {
        "Name": e.product.name,
        "Quantity": e.quantity,
        "Price": e.unitPrice,
      })
          .toList(),
    };

    final jsonFile = File("order.json");
    await jsonFile.writeAsString(jsonEncode(json));

    final exe = File("printer/PrintService.exe");

    if (!exe.existsSync()) {
      throw Exception(
        "PrintService.exe not found: ${exe.absolute.path}",
      );
    }

    final result = await Process.run(
      exe.absolute.path,
      [jsonFile.absolute.path],
    );

    print("Exit Code: ${result.exitCode}");
    print("STDOUT:");
    print(result.stdout);

    print("STDERR:");
    print(result.stderr);
  }
}