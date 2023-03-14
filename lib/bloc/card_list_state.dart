import 'package:card_list/todo/todo.dart';
import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final bool isDragging;
  final int dragIndex;
  final String dragTodo;
  final List<Todo> todoList;
  final List<Todo> checkedTodoList;
  final List<Todo> unCheckedTodoList;

  const CardListState({
    required this.isDragging,
    required this.dragIndex,
    required this.dragTodo,
    required this.todoList,
    required this.checkedTodoList,
    required this.unCheckedTodoList,
  });

  CardListState copyWith({
    bool? isDragging,
    int? dragIndex,
    String? dragTodo,
    List<Todo>? todoList,
    List<Todo>? checkedTodoList,
    List<Todo>? unCheckedTodoList,
  }) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      dragTodo: dragTodo ?? this.dragTodo,
      todoList: todoList ?? this.todoList,
      checkedTodoList: checkedTodoList ?? this.checkedTodoList,
      unCheckedTodoList: unCheckedTodoList ?? this.unCheckedTodoList,
    );
  }

  @override
  List<Object> get props => [
        isDragging,
        dragIndex,
        dragTodo,
        todoList,
        checkedTodoList,
        unCheckedTodoList
      ];
}
