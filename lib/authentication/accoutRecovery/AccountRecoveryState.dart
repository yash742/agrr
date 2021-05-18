import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';

class AccountRecoveryState {
  final String email;
  bool get recoveryEmail => email.contains("@") && email.length > 5;
  final AgrFormSubmissionStatus formStatus;
  AccountRecoveryState(
      {this.email = "", this.formStatus = const AgrInitialFormStatus()});
  AccountRecoveryState copyWith(
      {String email, AgrFormSubmissionStatus foormStatus}) {
    return AccountRecoveryState(
        email: email ?? this.email, formStatus: formStatus ?? this.formStatus);
  }
}
