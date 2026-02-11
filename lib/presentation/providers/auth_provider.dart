import 'package:flutter/foundation.dart';
import 'package:ecomerce/domain/entities/user_entity.dart';
import 'package:ecomerce/domain/repositories/auth_repository.dart';
import 'package:ecomerce/domain/usecases/sign_in_with_google_usecase.dart';

enum AuthStatus { initial, loading, authenticated, error }

class AuthProvider extends ChangeNotifier {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  AuthProvider(this._signInWithGoogleUseCase);

  AuthStatus _status = AuthStatus.initial;

  AuthStatus get status => _status;

  UserEntity? _user;

  UserEntity? get user => _user;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<void> signInWithGoogle() async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _signInWithGoogleUseCase();
      _status = AuthStatus.authenticated;
    } on AuthException catch (e) {
      _errorMessage = e.message;
      _status =
          e.type == AuthErrorType.cancelled
              ? AuthStatus.initial
              : AuthStatus.error;
    } catch (e) {
      _errorMessage = 'Error inesperado: $e';
      _status = AuthStatus.error;
    }

    notifyListeners();
  }

  void resetState() {
    _status = AuthStatus.initial;
    _errorMessage = null;
    _user = null;
    notifyListeners();
  }
}
