import 'package:ecomerce/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signInWithGoogle();

  Future<void> signOut();

  Stream<UserEntity?> get authStateChanges;
}

class AuthException implements Exception {
  final String message;
  final AuthErrorType type;

  const AuthException({required this.message, required this.type});

  @override
  String toString() => 'AuthException($type): $message';
}

enum AuthErrorType { cancelled, invalidCredentials, network, unknown }
