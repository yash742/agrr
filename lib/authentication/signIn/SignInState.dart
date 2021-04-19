import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';

class SignInState {
  final bool passwordIsVisible;
  bool get isVisible => passwordIsVisible;
  final String userEmail;
  bool get isValidUserEmail => userEmail.contains("@");
  final String password;
  bool get isValidPassWord => password.length >= 8;
  final AgrFormSubmissionStatus formStatus;
  SignInState(
      {this.userEmail = "",
      this.password = "",
      this.passwordIsVisible = true,
      this.formStatus = const AgrInitialFormStatus()});
  SignInState copyWith(
      {String userEmail,
      String password,
      bool isVisible,
      AgrFormSubmissionStatus formStatus}) {
    return SignInState(
        passwordIsVisible: isVisible ?? this.passwordIsVisible,
        userEmail: userEmail ?? this.userEmail,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
