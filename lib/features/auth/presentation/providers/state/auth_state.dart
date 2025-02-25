import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verymemo/features/auth/domain/models/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserModel user) = _Authenticated;
  const factory AuthState.unauthenticated() = _UnAuthenticated;
  const factory AuthState.error(String message) = _Error;
}
