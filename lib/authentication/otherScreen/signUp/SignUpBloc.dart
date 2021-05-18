import 'package:agr_/authentication/otherScreen/signUp/SignUpState.dart';
import 'package:agr_/authentication/otherScreen/signUp/signUpEvent.dart';
import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';
import 'package:agr_/repo/AuthRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  bool _passwordVisibility = true;
  SignUpBloc({this.authRepository}) : super(SignUpState());
  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpEmailChanged) {
      yield state.copyWith(userEmail: event.userEmail);
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignUpSubmitted) {
      yield state.copyWith(formStatus: AgrFormSibmitting());
      try {
        await authRepository.signup(userName: "", useremail: "", password: "");
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
