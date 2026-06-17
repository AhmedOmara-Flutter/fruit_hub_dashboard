import 'dart:convert';
import 'package:http/http.dart' as http;

class NotificationSender {
  static const String serverKey = 'PUT_YOUR_SERVER_KEY_HERE';

  static Future<void> send({
    required String token,
    required String title,
    required String body,
  }) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      },
      body: jsonEncode({
        "to": token,
        "notification": {
          "title": title,
          "body": body,
        },
      }),
    );
  }
}