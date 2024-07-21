import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/client.dart';

class ApiService {
  final String baseUrl = 'https://api.example.com'; // Replace with your API URL

  Future<Client> registerClient(Client client) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clients'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (response.statusCode == 201) {
      return Client.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register client');
    }
  }

  // Add more API methods as needed
}