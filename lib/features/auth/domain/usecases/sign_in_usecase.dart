import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:verymemo/features/auth/domain/models/user_model.dart';
import 'package:verymemo/features/auth/domain/repositories/auth_repository.dart';

final signInUseCaseProvider = Provider<SignInUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInUsecase(authRepository);
});

class SignInUsecase {
  final AuthRepository _authRepository;
  SignInUsecase(this._authRepository);

  Future<UserModel?> signInWithGoogle() async {
    try {
      return await _authRepository.signInWithGoogle();
    } catch (e) {
      throw Exception('Google 로그인 실패: $e');
    }
  }

  Future<UserModel?> signInWithApple() async {
    try {
      return await _authRepository.signInWithApple();
    } catch (e) {
      throw Exception('Apple 로그인 실패: $e');
    }
  }
}
