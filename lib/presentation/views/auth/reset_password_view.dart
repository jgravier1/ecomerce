import 'package:ecomerce/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomerce/l10n/app_localizations.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  void _showSuccessDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Imagen
              SvgPicture.asset('assets/svg/check.svg', width: 78, height: 78),
              SizedBox(height: 12),

              Text(
                l10n.passwordChanged,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Segundo texto (descripción)
              Text(
                l10n.passwordChangedMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 24),

              // PrimaryButton
              PrimaryButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  //navigate to login screen
                  context.goNamed('sign_up');
                },
                child: Text(l10n.login, style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.resetPassword,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              l10n.resetPasswordSubtitle,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                l10n.password,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.pleaseEnterPassword;
                }
                if (value.length < 8) {
                  return l10n.passwordMinLength;
                }
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  return l10n.passwordUppercase;
                }
                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                  return l10n.passwordSpecialChar;
                }
                return null;
              },
              decoration: InputDecoration(
                //color al borde
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: l10n.enterPassword,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                l10n.password,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.pleaseEnterPassword;
                }
                if (value.length < 8) {
                  return l10n.passwordMinLength;
                }
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  return l10n.passwordUppercase;
                }
                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                  return l10n.passwordSpecialChar;
                }
                return null;
              },
              decoration: InputDecoration(
                //color al borde
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: l10n.enterPassword,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: PrimaryButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  _showSuccessDialog(context);
                },
                child: Text(
                  l10n.continueButton,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
