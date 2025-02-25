import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verymemo/features/auth/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> signInWithGoogle();
  Future<UserModel?> signInWithApple();
  Future<void> signOut();
  Stream<UserModel?> authStateChanges();
  UserModel? getCurrentUser();
}

// 인증 결과를 나타내는 sealed class
sealed class AuthResult {
  const AuthResult();
}

final class AuthSuccess extends AuthResult {
  final User user;
  const AuthSuccess(this.user);
}

final class AuthFailure extends AuthResult {
  final String message;
  const AuthFailure(this.message);
}
