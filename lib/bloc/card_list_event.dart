import 'package:equatable/equatable.dart';

abstract class CardListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddTodoEvent extends CardListEvent {
  final String todo;
  AddTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class RemoveTodoEvent extends CardListEvent {
  final DateTime time;
  RemoveTodoEvent({required this.time});
  @override
  List<Object> get props => [time];
}

class ChangeTodoEvent extends CardListEvent {
  final String todo;
  final DateTime time;
  ChangeTodoEvent({required this.todo, required this.time});
  @override
  List<Object> get props => [todo, time];
}

class CheckTodoEvent extends CardListEvent {
  final DateTime time;
  CheckTodoEvent({required this.time});

  @override
  List<Object> get props => [time];
}

class DragStartEvent extends CardListEvent {
  final int index;
  DragStartEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class DragEndEvent extends CardListEvent {
  @override
  List<Object> get props => [];
}

class DragEvent extends CardListEvent {
  final int index;

  DragEvent({required this.index});

  @override
  List<Object> get props => [index];
}
