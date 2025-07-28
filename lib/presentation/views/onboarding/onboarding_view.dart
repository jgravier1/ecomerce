
import 'package:ecomerce/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
          child: PrimaryButton(
            backgroundColor: Colors.black,
            onPressed: () {
              context.pushReplacementNamed('authentication');
            },
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 8),
                SvgPicture.asset('assets/svg/arrow_right.svg', width: 24, height: 24),
              ],
            ),
          ),
        )
      ],
    );
  }
}
