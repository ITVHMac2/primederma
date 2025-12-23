import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class FCMService {
  // Replace with your server key file path (if stored locally in assets)
  final String serverKey = 'YOUR_SERVER_KEY_HERE';

  // Function to send notification
  Future<void> sendPushMessage(String token, String title, String body) async {
    try {
      // Define the FCM endpoint
      final url = Uri.parse(
          'https://fcm.googleapis.com/v1/projects/YOUR_PROJECT_ID/messages:send');
      // Define the message payload
      final message = {
        'message': {
          'token': token,
          'notification': {
            'title': title,
            'body': body,
          },
        },
      };

      // Set headers
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      };

      // Send the POST request to FCM
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        debugPrint('Notification sent successfully');
      } else {
        debugPrint('Failed to send notification: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error sending notification: $e');
    }
  }
}
