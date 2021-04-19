import 'package:agr_/flower/FlowerState.dart';
import 'package:agr_/flower/agrFlowerEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowerBloc extends Bloc<FlowerEvnts, FlowerState> {
  FlowerBloc() : super(FlowerState());

  @override
  Stream<FlowerState> mapEventToState(FlowerEvnts event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
