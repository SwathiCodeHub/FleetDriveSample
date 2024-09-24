import 'package:fleetdrive/Pages/LoginScreen/LoginStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState(pinCode: ''));

  void setPinCode(String pin) {
    state = state.copyWith(pinCode: pin);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setErrorMessage(String? message) {
    state = state.copyWith(errorMessage: message);
  }
}

// Provider for the login notifier
final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});
