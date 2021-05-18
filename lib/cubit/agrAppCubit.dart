


import 'package:flutter_bloc/flutter_bloc.dart';
//authcubit state
abstract class AgrSessionState {}

class Authenticated extends AgrSessionState {
  final dynamic user;
  Authenticated({this.user});
}

class UnAuthenticated extends AgrSessionState {}

class UnKnownSessionState extends AgrSessionState {}

//Agrsession Cubit
class AgrSessionCubit extends Cubit<AgrSessionState> {
  AgrSessionCubit() : super(UnKnownSessionState());
  void showLogUot() => emit(UnAuthenticated());
  void showAgrSessionView() => emit(Authenticated());
  void showAgrAuthView() => emit(UnAuthenticated());
}
