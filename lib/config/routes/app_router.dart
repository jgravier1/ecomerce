

import 'package:ecomerce/presentation/screens/auth/authentication_screen.dart';
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
      )
    ],
  );
}