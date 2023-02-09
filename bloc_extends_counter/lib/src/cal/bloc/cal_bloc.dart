import 'package:bloc_extends_counter/src/cal/bloc/cal_event.dart';
import 'package:bloc_extends_counter/src/cal/bloc/cal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalBloc extends Bloc<CalEvent, CalState> {
  CalBloc() : super(CalState.init()) {
    on<SubmitEvent>(_calulator);
    on<ZeroEvent>(_zero);
    on<ChangeAEvent>(_changeA);
  }

  _calulator(SubmitEvent event, emit) {
    if (event.operation == Operation.plus) {
      var res = event.numberA + event.numberB;
      emit(state.copyWith(result: res));
    } else if (event.operation == Operation.minus) {
      var res = event.numberA - event.numberB;
      emit(state.copyWith(result: res));
    } else if (event.operation == Operation.multiple) {
      var res = event.numberA * event.numberB;
      emit(state.copyWith(result: res));
    }
    // else if(event.operation == Operation.divide){
    //   var res = event.numberA / event.numberB;
    //   emit(state.c)
    // }
  }

  _zero(ZeroEvent event, emit) {
    emit(state.copyWith(result: 0));
  }

  _changeA(ChangeAEvent event,emit){
    emit(state.copyWith(numberA: event.numberA));
  }
}
