import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_client_screen.dart';
import '../screens/confirmation_email_screen.dart';
import '../screens/enter_confirmation_code_screen.dart';
import '../screens/set_password_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String registerClient = '/register-client';
  static const String confirmationEmail = '/confirmation-email';
  static const String enterConfirmationCode = '/enter-confirmation-code';
  static const String setPassword = '/set-password';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    registerClient: (context) => RegisterClientScreen(),
    confirmationEmail: (context) {
      final String email = ModalRoute.of(context)!.settings.arguments as String;
      return ConfirmationEmailScreen(email: email);
    },
    enterConfirmationCode: (context) {
      final String email = ModalRoute.of(context)!.settings.arguments as String;
      return EnterConfirmationCodeScreen(email: email);
    },
    setPassword: (context) {
      final String email = ModalRoute.of(context)!.settings.arguments as String;
      return SetPasswordScreen(email: email);
    },
  };
}