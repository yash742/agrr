abstract class SignInEvents {}

class SignInEmailChanged extends SignInEvents {
  final String userEmail;
  SignInEmailChanged({this.userEmail});
}

class SignInPasswordChanged extends SignInEvents {
  final String password;
  SignInPasswordChanged({this.password});
}

class SignInSubmitted extends SignInEvents {}

class PasswordVisibility extends SignInEvents {
  final bool isVisible;
  PasswordVisibility({this.isVisible});
}
