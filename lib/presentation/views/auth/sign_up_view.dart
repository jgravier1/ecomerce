import 'package:ecomerce/presentation/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomerce/l10n/app_localizations.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.loginToAccount,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              l10n.welcomeBack,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                l10n.email,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: l10n.enterEmailAddress,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
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
              decoration: InputDecoration(
                hintText: l10n.enterPassword,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(l10n.forgotPassword),
                Text.rich(
                  TextSpan(
                    text: l10n.resetYourPassword,
                    style: const TextStyle(
                      color: Colors.black, // Azul estilo Facebook
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed('forgot_password');
                          },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: PrimaryButton(
                backgroundColor: Color(0xFFCCCCCC),
                onPressed: () {
                  context.pushReplacementNamed('home');
                },
                child: Text(
                  l10n.login,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: Color(0xFFE6E6E6), thickness: 1.5),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(l10n.or),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xFFE6E6E6), thickness: 1),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            PrimaryButton(
              borderColor: Colors.grey,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/google_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    l10n.signUpWithGoogle,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            PrimaryButton(
              backgroundColor: Color(0xFF1877F2),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/logo_facebook.svg',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    l10n.signUpWithFacebook,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 48,
                left: 55,
                right: 55,
                bottom: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.dontHaveAccount, textAlign: TextAlign.center),
                  Text.rich(
                    TextSpan(
                      text: l10n.join,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.replaceNamed('authentication');
                            },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
