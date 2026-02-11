import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:ecomerce/presentation/widgets/google_sign_in_button.dart';
import 'package:ecomerce/presentation/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.createAccount,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    l10n.createAccountSubtitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 4),
                    child: Text(
                      l10n.fullName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.pleaseEnterFullName;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: l10n.enterFullName,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 4),
                    child: Text(
                      l10n.email,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.pleaseEnterEmail;
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return l10n.pleaseEnterValidEmail;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: l10n.enterEmailAddress,
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                  SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(text: l10n.agreeToTerms),
                        TextSpan(
                          text: l10n.termsOfService,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: PrimaryButton(
                      backgroundColor: Color(0xFFCCCCCC),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Formulario válido, proceder con la creación de cuenta
                        }
                      },
                      child: Text(
                        l10n.createAccountButton,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFE6E6E6),
                            thickness: 1.5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(l10n.or),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFE6E6E6),
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  const GoogleSignInButton(),
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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            l10n.alreadyHaveAccount,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            ' ',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text.rich(
                            TextSpan(
                              text: l10n.logIn,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pushNamed('sign_up');
                                    },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
