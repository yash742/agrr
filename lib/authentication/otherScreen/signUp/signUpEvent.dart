abstract class SignUpEvent {}

class SignUpUserNameChanged extends SignUpEvent {
  final String userName;
  SignUpUserNameChanged({this.userName});
}

class SignUpEmailChanged extends SignUpEvent {
  final String userEmail;
  SignUpEmailChanged({this.userEmail});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  SignUpPasswordChanged({this.password});
}

class SignUpSubmitted extends SignUpEvent {}

class PasswordVisibility extends SignUpEvent {
  final bool isVisible;
  PasswordVisibility({this.isVisible});
}
