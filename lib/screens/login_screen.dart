import 'package:flutter/material.dart';
import '../config/app_routes.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/bmoi.png', height: 100),
                SizedBox(height: 48),
                CustomTextField(
                  label: 'Correo electrónico',
                  onChanged: (value) => _email = value,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Contraseña',
                  onChanged: (value) => _password = value,
                  obscureText: true,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Iniciar sesión',
                  onPressed: _login,
                ),
                SizedBox(height: 16),
                TextButton(
                  child: Text('¿No tienes una cuenta? Regístrate'),
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.registerClient),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = await _authService.login(_email, _password);
        // Navigate to home screen or show success message
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error de inicio de sesión: $e')),
        );
      }
    }
  }
}