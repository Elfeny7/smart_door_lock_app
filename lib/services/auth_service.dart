import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class AuthService {
  Future<Map<String, dynamic>?> loginByEmailAndPin(
      String email, String pin) async {
    final response = await http.get(
      Uri.parse('${Config.baseUrl}/api/user/$email/$pin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
