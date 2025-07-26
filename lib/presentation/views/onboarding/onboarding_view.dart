
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 60,
                left: 24,
                child: Text(
                  'Define\nyourself in\nyour unique\nway.',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -5,
                    height: 0.8,
                    color: Colors.black,
                  ),
                ),
              ),
                Positioned.fill(
                  top: 170,
                child: Image.asset(
                  'assets/images/person.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[300],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 24, right: 25, bottom: 24),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.pushReplacementNamed('authentication');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
