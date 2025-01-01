import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  static const String baseUrl = "https://gateway-test.kebu.io"; // Base URL

  // Method to get error codes
  Future<Map<String, dynamic>> fetchErrorCodes() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/v1/profile/public/error/codes'));

    if (response.statusCode == 200) {
      // If server returns 200 OK, parse the response
      return json.decode(response.body);
    } else {
      // If the server returns an error, throw an exception
      throw Exception('Failed to load error codes');
    }
  }

  // Method to get authentication token
  Future<Map<String, dynamic>> authenticateUser(
      String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/v2/auth/token'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'username': username,
        'password': password,
        'deviceId': null,
        'category': 'CLIENT',
      }),
    );

    if (response.statusCode == 200) {
      // If server returns 200 OK, parse the response
      return json.decode(response.body);
    } else {
      // If the server returns an error, throw an exception
      throw Exception('Failed to authenticate');
    }
  }

  // Method to refresh access token
  Future<Map<String, dynamic>> refreshAccessToken(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/v2/token/refresh'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'refreshToken': refreshToken,
        'category': 'CLIENT',
      }),
    );

    if (response.statusCode == 200) {
      // If server returns 200 OK, parse the response
      return json.decode(response.body);
    } else {
      // If the server returns an error, throw an exception
      throw Exception('Failed to refresh token');
    }
  }
}
