import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/features/auth/data/datasources/supabase/supabase_service.dart';
import 'package:verymemo/features/auth/domain/models/user_model.dart';
import 'package:verymemo/features/auth/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final supabaseService = ref.watch(supabaseServiceProvider);
  return AuthRepositoryImpl(supabaseService);
});

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseService _supabaseService;

  AuthRepositoryImpl(this._supabaseService);
  @override
  Stream<UserModel?> authStateChanges() {
    return _supabaseService.authStateChanges().map((user) => user);
  }

  @override
  UserModel? getCurrentUser() {
    return _supabaseService.getCurrentUser();
  }

  @override
  Future<UserModel> signInWithApple() async {
    return await _supabaseService.signInWithApple();
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    return await _supabaseService.signInWithGoogle();
  }

  @override
  Future<void> signOut() async {
    await _supabaseService.signOut();
  }
}
