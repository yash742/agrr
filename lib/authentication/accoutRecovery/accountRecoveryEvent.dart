abstract class AccountRecoveryEvent {}

class AccountRecoveryEmailChanged extends AccountRecoveryEvent {
  final String email;

  AccountRecoveryEmailChanged({this.email});
}

class AccountRecoverySubmitted extends AccountRecoveryEvent {}
