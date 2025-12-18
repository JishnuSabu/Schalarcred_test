import 'package:scholarcred_test/features/auth/data/data_sources/supabase_auth_data_sources.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
  String? getCurrentUserId();
}

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<void> login(String email, String password) async {
    await dataSource.login(email, password);
  }

  @override
  Future<void> register(String email, String password) async {
    await dataSource.register(email, password);
  }

  @override
  Future<void> logout() async {
    await dataSource.logout();
  }

  @override
  String? getCurrentUserId() => dataSource.currentUser?.id;
}
