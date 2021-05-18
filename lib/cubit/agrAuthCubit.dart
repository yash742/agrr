import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AccountState {}

class LogInToAccount extends AccountState {}

class SignUpToAccount extends AccountState {}

class SelectAccountType extends AccountState {}

class AccountRecovery extends AccountState {
  final String email;
  AccountRecovery({this.email});
}

class BusinessAccount extends AccountState {
  static const String businessConstant = "business@";
  // final bool business;
  //BusinessAccount({this.business});
}

class AudienceAccount extends AccountState {
  static const String audienceConstant = "user";
}

class AgrAuthCubit extends Cubit<AccountState> {
  AgrAuthCubit() : super(LogInToAccount());
  void showLogIn() => emit(LogInToAccount());
  void showSignUp() => emit(SignUpToAccount());
  void showAccountRecovery() => emit(AccountRecovery());
  void showAccountType() => emit(SelectAccountType());
  void showBusinessAccount() => emit(BusinessAccount());
  void showAudienceAccount() => emit(AudienceAccount());
}

/*enum AuthStates {
  logIn,
  signUp,
  selectAccountType,
  yesBusinessSelected,
  yesAudienceSelected,
  accountRecovery
}

class AgrAuthCubit extends Cubit<AuthStates> {
  AgrAuthCubit() : super(AuthStates.logIn);
  void showLogIn() => emit(AuthStates.logIn);
  void shoeSignUp() => emit(AuthStates.signUp);
  void showAccountRecovery() => emit(AuthStates.accountRecovery);
  void showSelectAccountType() => emit(AuthStates.selectAccountType);
  void showBusinessWlecome() => emit(AuthStates.yesBusinessSelected);
  void showAudienceWelcome() => emit(AuthStates.yesAudienceSelected);
}*///can call abstracct state to hold value
