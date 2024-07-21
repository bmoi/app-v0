import 'package:flutter/material.dart';
import '../config/app_routes.dart';
import '../widgets/custom_button.dart';

class ConfirmationEmailScreen extends StatelessWidget {
  final String email;

  ConfirmationEmailScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/bmoi_logo.png', height: 100),
              SizedBox(height: 48),
              Text(
                '914863 es tu código de Bmoi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Hola,\n\nAlguien intentó registrarse para obtener una cuenta de Bmoi con $email. Si fue usted, ingrese este código de confirmación en la aplicación:',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Text(
                '914863',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              CustomButton(
                text: 'Ingresar código',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.enterConfirmationCode,
                    arguments: email,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}