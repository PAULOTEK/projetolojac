import 'package:loja/domain/repositories/auth_repository.interface.dart';

class SignOutUseCase {
  final AuthRepositoryInterface _authRepository;

  SignOutUseCase(this._authRepository);

  Future<void> call() async {
    return _authRepository.signOut();
  }
}
