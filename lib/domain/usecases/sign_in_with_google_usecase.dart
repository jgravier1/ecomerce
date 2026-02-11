import 'package:ecomerce/domain/entities/user_entity.dart';
import 'package:ecomerce/domain/repositories/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository _repository;

  const SignInWithGoogleUseCase(this._repository);

  Future<UserEntity> call() async {
    return await _repository.signInWithGoogle();
  }
}
