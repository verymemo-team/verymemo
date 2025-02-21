import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verymemo/features/auth/domain/models/user_model.dart';

class SupabaseService {
  final SupabaseClient _supabaseClient;
  final GoogleSignIn _googleSignIn;

  SupabaseService({
    required SupabaseClient supabaseClient,
    required GoogleSignIn googleSignIn,
  })  : _supabaseClient = supabaseClient,
        _googleSignIn = googleSignIn;

  UserModel? getCurrentUser() {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) return null;
    return UserModel.fromSupabaseUser(user);
  }
}
