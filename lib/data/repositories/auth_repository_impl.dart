import 'package:ecomerce/data/datasources/google_sign_in_datasource.dart';
import 'package:ecomerce/domain/entities/user_entity.dart';
import 'package:ecomerce/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignInDatasource _datasource;

  const AuthRepositoryImpl(this._datasource);

  @override
  Future<UserEntity> signInWithGoogle() async {
    final userCredential = await _datasource.signInWithGoogle();
    final firebaseUser = userCredential.user;

    if (firebaseUser == null) {
      throw const AuthException(
        message: 'No se pudo obtener la información del usuario.',
        type: AuthErrorType.unknown,
      );
    }

    return _mapFirebaseUserToEntity(firebaseUser);
  }

  @override
  Future<void> signOut() async {
    await _datasource.signOut();
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return _datasource.authStateChanges.map((firebaseUser) {
      if (firebaseUser == null) return null;
      return _mapFirebaseUserToEntity(firebaseUser);
    });
  }

  UserEntity _mapFirebaseUserToEntity(dynamic firebaseUser) {
    return UserEntity(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
    );
  }
}
