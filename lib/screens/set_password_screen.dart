import 'package:flutter/material.dart';
import '../config/app_routes.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SetPasswordScreen extends StatefulWidget {
  final String email;

  SetPasswordScreen({required this.email});

  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Establecer contraseña')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  label: 'Nueva contraseña',
                  onChanged: (value) => _password = value,
                  obscureText: true,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Confirmar contraseña',
                  onChanged: (value) => _confirmPassword = value,
                  obscureText: true,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Establecer contraseña',
                  onPressed: _setPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setPassword() async {
    if (_formKey.currentState!.validate()) {
      if (_password != _confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Las contraseñas no coinciden')),
        );
        return;
      }
      try {
        await _authService.setPassword(widget.email, _password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Contraseña establecida con éxito')),
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.login,
          (route) => false,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al establecer la contraseña: $e')),
        );
      }
    }
  }
}