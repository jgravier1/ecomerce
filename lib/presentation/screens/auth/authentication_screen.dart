import 'package:ecomerce/presentation/views/auth/authentication_view.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationView(),
    );
  }
}
