import 'package:verymemo/common/configs/app_config.dart';
import 'package:verymemo/main/main.dart';

void main() {
  AppConfig.initialize(
    apiUrl: const String.fromEnvironment('API_URL',
        defaultValue: 'https://dev-api.example.com'),
    environment: 'dev',
    supabaseUrl: const String.fromEnvironment('SUPABASE_URL'),
    supabaseAnonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  mainCommon();
}
