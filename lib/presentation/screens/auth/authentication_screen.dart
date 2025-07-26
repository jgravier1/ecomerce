import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text('Create an account.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
