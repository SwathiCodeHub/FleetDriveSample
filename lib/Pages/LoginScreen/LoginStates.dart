class LoginState {
  final String pinCode;
  final bool isLoading;
  final String? errorMessage;

  LoginState({
    required this.pinCode,
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    String? pinCode,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      pinCode: pinCode ?? this.pinCode,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
