import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class AuthService {
  final String baseUrl = 'https://api.example.com'; // Replace with your API URL

  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<bool> verifyConfirmationCode(String email, String confirmationCode) async {
  try {
    // 1. Obtener el código almacenado para el correo electrónico
    final storedCode = await _getCodeFromStorage(email); 

    // 2. Verificar si el código coincide
    if (storedCode == confirmationCode) {
      // Código válido, marcar como verificado (opcional)
      await _markEmailAsVerified(email);
      return true;
    } else {
      return false; // Código inválido
    }

  } catch (error) {
    // Manejo de errores (registro, notificación al usuario, etc.)
    print("Error verifying confirmation code: $error");
    return false; 
  }
}
// Métodos auxiliares (implementación depende de tu sistema de almacenamiento)
Future<String?> _getCodeFromStorage(String email) async { /* ... */ }
Future<void> _markEmailAsVerified(String email) async { /* ... */ }

  Future<void> setPassword(String email, String password) async {
    // Lógica para establecer la contraseña

  }
  // Add more authentication methods as needed
}