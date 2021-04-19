import 'package:agr_/agape/AgapeState.dart';
import 'package:agr_/agape/agpEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgapeBloc extends Bloc<AgapeEvent, AgapeState> {
  AgapeBloc() : super(AgapeState());
  @override
  Stream<AgapeState> mapEventToState(AgapeEvent event) {}
}
