import 'package:agr_/authentication/signIn/SignInEvent.dart';
import 'package:agr_/authentication/signIn/SignInState.dart';
import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';
import 'package:agr_/repo/AuthRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  bool _passwordVisibility = true;
  final AuthRepository authRepo;
  SignInBloc({this.authRepo}) : super(SignInState());

  @override
  Stream<SignInState> mapEventToState(SignInEvents event) async* {
    if (event is SignInEmailChanged) {
      yield state.copyWith(userEmail: event.userEmail);
    } else if (event is SignInPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignInSubmitted) {
      yield state.copyWith(formStatus: AgrFormSibmitting());
      try {
        await authRepo.signIn(password: '', useremail: "");
        yield state.copyWith(formStatus: AgrFormSucess());
      } catch (e) {
        yield state.copyWith(formStatus: AgrFormFaild());
      }
    } else if (event is PasswordVisibility) {
      _passwordVisibility = !_passwordVisibility;
      yield state.copyWith(isVisible: _passwordVisibility);
    }
  }
}
