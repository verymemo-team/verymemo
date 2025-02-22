import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verymemo/common/types/typedef.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum AuthProvider {
  google,
  apple,
  unknown,
}

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
    required AuthProvider provider,
    required DateTime createdAt,
    DateTime? lastSignInAt,
  }) = _UserModel;

  factory UserModel.fromJson(MAP json) => _$UserModelFromJson(json);

  factory UserModel.fromSupabaseUser(User user) {
    AuthProvider provider = AuthProvider.unknown;
    if (user.appMetadata['provider'] == 'google') {
      provider = AuthProvider.google;
    } else if (user.appMetadata['provider'] == 'apple') {
      provider = AuthProvider.apple;
    }
    return UserModel(
      id: user.id,
      email: user.email ?? "",
      displayName: user.userMetadata?['name'],
      photoUrl: user.userMetadata?['avatar_url'],
      provider: provider,
      createdAt: DateTime.parse(user.createdAt),
      lastSignInAt:
          user.lastSignInAt != null ? DateTime.parse(user.lastSignInAt!) : null,
    );
  }
}
