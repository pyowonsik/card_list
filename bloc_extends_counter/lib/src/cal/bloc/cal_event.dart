import 'package:bloc_extends_counter/src/cal/bloc/cal_bloc.dart';
import 'package:equatable/equatable.dart';

enum Operation { plus, minus, multiple, divide }

abstract class CalEvent extends Equatable {
  List<Object> get props => [];
}

class SubmitEvent extends CalEvent {
  final Operation operation;
  final int numberA;
  final int numberB;

  SubmitEvent(this.operation, this.numberA, this.numberB);

  // state 등록
  List<Object> get props => [operation, numberA, numberB];
}
class ChangeAEvent extends CalEvent{
  final int numberA;
  ChangeAEvent(this.numberA);
  List<Object> get props => [numberA];
}
class ZeroEvent extends CalEvent {}
