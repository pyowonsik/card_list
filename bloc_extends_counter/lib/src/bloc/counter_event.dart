import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{
  List<Object> get props => [];
}

class IncreaseEvent extends CounterEvent{}

class DecreaseEvent extends CounterEvent{}

class ZeroEvent extends CounterEvent{}

class ChangeEvent extends CounterEvent{
  final int num;
  ChangeEvent(this.num);
}