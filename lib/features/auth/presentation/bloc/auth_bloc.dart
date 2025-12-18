import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarcred_test/features/auth/domain/use_cases/login_user.dart';
import 'package:scholarcred_test/features/auth/domain/use_cases/register_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthBloc({required this.loginUser, required this.registerUser})
    : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await loginUser(event.email, event.password);
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthError('Login failed: ${e.toString()}'));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await registerUser(event.email, event.password);
      emit(AuthRegistrationSuccess());
    } catch (e) {
      emit(AuthError('Registration failed: ${e.toString()}'));
    }
  }

  void _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      emit(AuthUnauthenticated());
    } catch (_) {
      emit(AuthError('Logout failed'));
    }
  }
}
