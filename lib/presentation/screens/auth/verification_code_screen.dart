import 'package:ecomerce/presentation/views/auth/verification_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset('assets/svg/arrow.svg'),
        ),
        backgroundColor: Colors.white,
      ),
      body: VerificationCodeView(),
    );
  }
}