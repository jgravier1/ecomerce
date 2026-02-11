import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:ecomerce/presentation/providers/auth_provider.dart';
import 'package:ecomerce/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        _handleAuthState(context, authProvider);

        final isLoading = authProvider.status == AuthStatus.loading;

        return PrimaryButton(
          borderColor: Colors.grey,
          backgroundColor: Colors.white,
          onPressed: isLoading ? () {} : () => authProvider.signInWithGoogle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else
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
        );
      },
    );
  }

  void _handleAuthState(BuildContext context, AuthProvider authProvider) {
    if (authProvider.status == AuthStatus.error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? 'Error desconocido'),
            backgroundColor: Colors.red[700],
          ),
        );
        authProvider.resetState();
      });
    }

    if (authProvider.status == AuthStatus.authenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '¡Bienvenido, ${authProvider.user?.displayName ?? 'usuario'}!',
            ),
            backgroundColor: Colors.green[700],
          ),
        );
        context.goNamed('home');
      });
    }
  }
}
