import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);
}

class CounterInitState extends CounterState {
  CounterInitState() : super(0);
  List<Object> get props => [this.count];
}

class CounterChangeState extends CounterState {
  const CounterChangeState(super.count);
  List<Object> get props => [this.count];
}
