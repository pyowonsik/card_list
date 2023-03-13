import 'package:card_list/todo/todo.dart';
import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  // final Todo todos; <- model로 묶어서 관린
  final bool isDragging;
  final int dragIndex;
  final String dragTodo;
  final List<String> todos;
  final List<bool> isChecked;
  final List<Todo> todoList;

  const CardListState({
    required this.isDragging,
    required this.dragIndex,
    required this.todos,
    required this.dragTodo,
    required this.isChecked,
    required this.todoList,
  });

  CardListState copyWith({
    bool? isDragging,
    int? dragIndex,
    String? dragTodo,
    List<String>? todos,
    List<bool>? isChecked,
    List<Todo>? todoList,
  }) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      todos: todos ?? this.todos,
      dragTodo: dragTodo ?? this.dragTodo,
      isChecked: isChecked ?? this.isChecked,
      todoList: todoList ?? this.todoList,
    );
  }

  @override
  List<Object> get props =>
      [isDragging, dragIndex, todos, dragTodo, isChecked, todoList];
}
