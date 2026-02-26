import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zylu_employee_app/core/constants/api_constants.dart';

class ApiClient {
  ApiClient();

  final http.Client client = http.Client();

  // Common headers
  Map<String, String> _headers() {
    return {"Content-Type": "application/json", "Accept": "application/json"};
  }

  // GET request
  Future<dynamic> get(String endpoint) async {
    final response = await client.get(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: _headers(),
    );

    debugPrint("🌐 GET Request: ${ApiConstants.baseUrl + endpoint}");
    debugPrint("✅ GET Response: ${response.body}");

    return _processResponse(response);
  }

  // POST request
  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await client.post(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: _headers(),
      body: jsonEncode(body),
    );

    debugPrint("🌐 POST Request: ${ApiConstants.baseUrl + endpoint}");
    debugPrint("✅ POST Response: ${response.body}");

    return _processResponse(response);
  }

  // Handle response
  dynamic _processResponse(http.Response response) {
    final decoded = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decoded;
    } else {
      throw Exception(decoded['message'] ?? "API Error");
    }
  }
}
