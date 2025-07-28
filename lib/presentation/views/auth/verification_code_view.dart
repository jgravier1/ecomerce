import 'package:ecomerce/presentation/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  bool _showError = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Widget _buildPinField(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              _showError && _controllers[index].text.isEmpty
                  ? Colors.red
                  : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (value) {
          // Reset error state when user starts typing
          if (_showError) {
            setState(() {
              _showError = false;
            });
          }

          if (value.length == 1) {
            if (index < 3) {
              _focusNodes[index + 1].requestFocus();
            } else {
              _focusNodes[index].unfocus();
            }
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
        decoration: InputDecoration(border: InputBorder.none, counterText: ''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter 4 Digit Code',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              children: [
                TextSpan(
                  text:
                      ' Enter 4 digit code that your receive on your\n email ',
                ),
                TextSpan(
                  text: '(cody.fisher45@example.com).',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) => _buildPinField(index)),
          ),
          if (_showError)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Please enter all digits',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Email not received?'),
                Text.rich(
                  TextSpan(
                    text: 'Resend code',
                    style: const TextStyle(
                      color: Colors.black, // Azul estilo Facebook
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            backgroundColor: Colors.black,
            onPressed: () {
              if (_controllers.every(
                (controller) => controller.text.isNotEmpty,
              )) {
                // Handle the verification code submission
                // For example, navigate to the next screen or show a success message
                context.pushNamed('reset_password'); // Replace with your actual route
              } else {
                // Show error state and update UI
                setState(() {
                  _showError = true;
                });
              }
            },
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
