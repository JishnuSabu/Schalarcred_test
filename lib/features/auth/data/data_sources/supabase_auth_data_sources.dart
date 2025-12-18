import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDataSource {
  final SupabaseClient client;

  SupabaseAuthDataSource(this.client);

  /// Login with email and password
  Future<User> login(String email, String password) async {
    final res = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (res.user == null) {
      throw Exception('Login failed');
    }

    return res.user!;
  }

  /// Register a new user
  Future<void> register(String email, String password) async {
    final res = await client.auth.signUp(email: email, password: password);

    if (res.user == null) {
      throw Exception('Registration failed');
    }
  }

  /// Logout
  Future<void> logout() async {
    await client.auth.signOut();
  }

  /// Get current user
  User? get currentUser => client.auth.currentUser;
}
