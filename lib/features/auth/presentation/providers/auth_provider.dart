// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:verymemo/features/auth/data/repositories/auth_repository_impl.dart';
// import 'package:verymemo/features/auth/data/datasources/supabase/supabase_service.dart';
// import 'package:verymemo/features/auth/domain/auth_repository.dart';

// // Supabase 클라이언트 Provider
// final supabaseClientProvider = Provider<SupabaseClient>((ref) {
//   return Supabase.instance.client;
// });

// // Supabase 서비스 Provider
// final supabaseServiceProvider = Provider<SupabaseService>((ref) {
//   final client = ref.watch(supabaseClientProvider);
//   return SupabaseService(client);
// });

// // Auth Repository Provider
// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   final supabaseService = ref.watch(supabaseServiceProvider);
//   return AuthRepositoryImpl(supabaseService);
// });

// // 현재 인증 상태를 관리하는 Provider
// final authStateProvider = StreamProvider<User?>((ref) {
//   final repository = ref.watch(authRepositoryProvider);
//   return repository.authStateChanges();
// });

// // 현재 사용자 Provider
// final currentUserProvider = Provider<User?>((ref) {
//   return ref.watch(authStateProvider).value;
// });
