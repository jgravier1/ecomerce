import 'package:ecomerce/config/di/injection_container.dart';
import 'package:ecomerce/presentation/providers/auth_provider.dart';
import 'package:ecomerce/presentation/views/auth/authentication_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => getIt<AuthProvider>(),
      child: const Scaffold(
        body: AuthenticationView(),
      ),
    );
  }
}
