import 'package:flutter/material.dart';
import '../config/app_routes.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class EnterConfirmationCodeScreen extends StatefulWidget {
  final String email;

  EnterConfirmationCodeScreen({required this.email});

  @override
  _EnterConfirmationCodeScreenState createState() => _EnterConfirmationCodeScreenState();
}

class _EnterConfirmationCodeScreenState extends State<EnterConfirmationCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String _confirmationCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingresar código de confirmación')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  label: 'Código de confirmación',
                  onChanged: (value) => _confirmationCode = value,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Verificar código',
                  onPressed: _verifyCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verifyCode() async {
    if (_formKey.currentState!.validate()) {
      try {
        final isValid = await _authService.verifyConfirmationCode(widget.email, _confirmationCode);
        if (isValid) {
          Navigator.pushNamed(
            context,
            AppRoutes.setPassword,
            arguments: widget.email,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Código de confirmación inválido')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al verificar el código: $e')),
        );
      }
    }
  }
}