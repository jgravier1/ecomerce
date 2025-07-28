

import 'package:ecomerce/presentation/screens/auth/authentication_screen.dart';
import 'package:ecomerce/presentation/screens/auth/forgot_password_screen.dart';
import 'package:ecomerce/presentation/screens/auth/sign_up_screen.dart';
import 'package:ecomerce/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        name: 'onboarding',
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: 'authentication',
        path: '/authentication',
        builder: (context, state) => const AuthenticationScreen(),
      ),
      GoRoute(
        name: 'sign_up',
        path: '/sign_up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: 'forgot_password',
        path: '/forgot_password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}