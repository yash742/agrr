import 'package:agr_/authentication/accoutRecovery/AccountRecoveryState.dart';
import 'package:agr_/authentication/accoutRecovery/accountRecoveryEvent.dart';
import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountRecoveryBloc
    extends Bloc<AccountRecoveryEvent, AccountRecoveryState> {
  AccountRecoveryBloc() : super(AccountRecoveryState());
  @override
  Stream<AccountRecoveryState> mapEventToState(
      AccountRecoveryEvent event) async* {
    if (event is AccountRecoveryEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is AccountRecoverySubmitted) {
      yield state.copyWith(foormStatus: AgrFormSibmitting());
      try {
        yield state.copyWith(foormStatus: AgrFormSucess());
      } catch (e) {
        yield state.copyWith(foormStatus: AgrFormFaild());
      }
    }
  }
}
