import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_door_lock_app/config/config.dart';

class DoorService {
  static Future<List<Map<String, dynamic>>> doorsByUser(String userId) async {
    final response = await http.get(
      Uri.parse('${Config.baseUrl}/api/door-user/$userId/doors'),
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(responseData);
    } else {
      throw Exception('Failed to load doors');
    }
  }

  static Future<void> mobilePost(String pin, Map<String, dynamic> door) async {
    try {
      final response = await http.post(
        Uri.parse('${Config.baseUrl}/api/mobile-post'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'pin': pin,
          'door_id': door['id'].toString(),
        }),
      );

      if (response.statusCode == 200) {
        print('Data mobile berhasil ditambahkan!');
        print(response.body);
        // Handle response as needed
      } else {
        print(
            'Gagal menambahkan data mobile. Status code: ${response.statusCode}');
        print(response.body);
        // Handle error response
      }
    } catch (e) {
      print('Error: $e');
      // Handle error jika terjadi kesalahan dalam melakukan HTTP request
    }
  }
}
