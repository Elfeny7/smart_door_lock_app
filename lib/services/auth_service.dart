import 'dart:convert';
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
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['data'];
    } else {
      return null;
    }
  }
}
