import 'dart:convert';
import 'package:fitness/services/http_service.dart';

class ApiService {
  final HttpService httpService;

  ApiService(this.httpService);

  Future<Map<String, dynamic>> userLogin(
      String user, String email_mobile, String password) async {
    final Map<String, String> credentials = {
      "email_mobile": email_mobile,
      "password": password
    };

    // Make a POST request to your login endpoint
    final response = await httpService.post('user/login', credentials);
    if (response.statusCode == 200) {
      // Login successful, parse and return the user data or token
      final Map<String, dynamic> userData = json.decode(response.body);
      print(userData);
      return userData;
    } else {
      // Login failed, handle the error appropriately
      throw Exception('Login failed');
    }
  }

  Future<List<dynamic>> fetchItems() async {
    final response = await httpService.get('/items');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  Future<Map<String, dynamic>> createItem(Map<String, dynamic> itemData) async {
    final response = await httpService.post('/items', itemData);
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to create item');
    }
  }
}
