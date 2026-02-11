import 'package:get_it/get_it.dart';
import 'package:ecomerce/data/datasources/google_sign_in_datasource.dart';
import 'package:ecomerce/data/repositories/auth_repository_impl.dart';
import 'package:ecomerce/domain/repositories/auth_repository.dart';
import 'package:ecomerce/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:ecomerce/presentation/providers/auth_provider.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<GoogleSignInDatasource>(
    () => GoogleSignInDatasource(),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<GoogleSignInDatasource>()),
  );

  getIt.registerFactory<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(getIt<AuthRepository>()),
  );

  getIt.registerFactory<AuthProvider>(
    () => AuthProvider(getIt<SignInWithGoogleUseCase>()),
  );
}
