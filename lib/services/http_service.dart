import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl;

  HttpService(this.baseUrl);

  Future<http.Response> get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl$path'));
    return response;
  }

  Future<http.Response> post(String path, Map<String, dynamic> body) async {
    print("in postmethod");
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      body: jsonEncode(body),
      // headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  // Implement methods for other HTTP verbs (PUT, DELETE, etc.) as needed
}
