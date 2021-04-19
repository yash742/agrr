import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';

class SignUpState {
  final bool passwordisVisible;
  bool get isVisible => passwordisVisible;
  final String userEmail;
  bool get isValidEmail => userEmail.contains("@");
  final String userName;
  bool get isValiduserNaame => password.length >= 2;
  final String password;
  bool get isValidPassWord => password.length >= 8;
  final AgrFormSubmissionStatus formStatus;
  SignUpState(
      {this.passwordisVisible = true,
      this.userName = "",
      this.userEmail = "",
      this.password = "",
      this.formStatus = const AgrInitialFormStatus()});
  SignUpState copyWith(
      {bool isVisible,
      String userName,
      String password,
      String userEmail,
      AgrFormSubmissionStatus formStatus}) {
    return SignUpState(
        passwordisVisible: isVisible ?? this.passwordisVisible,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
