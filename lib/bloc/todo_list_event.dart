import 'package:card_list/model/todo.dart';

abstract class TodoListEvent {}

class AddTodoEvent extends TodoListEvent {
  final String todo;
  AddTodoEvent({required this.todo});
}

class RemoveTodoEvent extends TodoListEvent {
  final DateTime time;
  RemoveTodoEvent({required this.time});
}

class ChangeTodoNameEvent extends TodoListEvent {
  final String todo;
  final DateTime time;
  ChangeTodoNameEvent({required this.todo, required this.time});
}

class CheckTodoEvent extends TodoListEvent {
  final DateTime time;
  CheckTodoEvent({required this.time});
}

class SearchTodoEvent extends TodoListEvent {
  final String todoName;
  final List<Todo> todo;
  SearchTodoEvent({required this.todoName, required this.todo});
}

class DragStartEvent extends TodoListEvent {
  final int index;
  DragStartEvent({required this.index});
}

class DragEndEvent extends TodoListEvent {}

class DragEvent extends TodoListEvent {
  final int index;

  DragEvent({required this.index});
}
