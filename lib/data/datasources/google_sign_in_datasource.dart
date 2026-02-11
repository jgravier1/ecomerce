import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecomerce/domain/repositories/auth_repository.dart';

class GoogleSignInDatasource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  GoogleSignInDatasource({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw const AuthException(
          message: 'El inicio de sesión fue cancelado por el usuario.',
          type: AuthErrorType.cancelled,
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on AuthException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      throw AuthException(
        message: 'Error inesperado durante el inicio de sesión: $e',
        type: AuthErrorType.unknown,
      );
    }
  }

  Future<void> signOut() async {
    await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  AuthException _mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return const AuthException(
          message:
              'Ya existe una cuenta con este correo usando otro proveedor.',
          type: AuthErrorType.invalidCredentials,
        );
      case 'invalid-credential':
        return const AuthException(
          message: 'Las credenciales proporcionadas son inválidas o expiraron.',
          type: AuthErrorType.invalidCredentials,
        );
      case 'user-disabled':
        return const AuthException(
          message: 'Esta cuenta ha sido deshabilitada.',
          type: AuthErrorType.invalidCredentials,
        );
      case 'network-request-failed':
        return const AuthException(
          message:
              'Error de conexión. Verifica tu conexión a internet e intenta de nuevo.',
          type: AuthErrorType.network,
        );
      default:
        return AuthException(
          message: e.message ?? 'Error de autenticación desconocido.',
          type: AuthErrorType.unknown,
        );
    }
  }
}
