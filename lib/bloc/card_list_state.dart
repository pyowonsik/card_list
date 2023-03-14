import 'package:card_list/todo/todo.dart';
import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final bool isDragging;
  final int dragIndex;
  final String dragTodo;
  final List<String> todos;
  final List<bool> isChecked;
  final List<String> todoList;
  final List<bool> checkedList;
  final List<Todo> todoModel;

  const CardListState({
    required this.isDragging,
    required this.dragIndex,
    required this.todos,
    required this.dragTodo,
    required this.isChecked,
    required this.todoList,
    required this.checkedList,
    required this.todoModel,
  });

  CardListState copyWith({
    bool? isDragging,
    int? dragIndex,
    String? dragTodo,
    List<String>? todos,
    List<bool>? isChecked,
    List<String>? todoList,
    List<bool>? checkedList,
    List<Todo>? todoModel,
  }) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      todos: todos ?? this.todos,
      dragTodo: dragTodo ?? this.dragTodo,
      isChecked: isChecked ?? this.isChecked,
      todoList: todoList ?? this.todoList,
      checkedList: checkedList ?? this.checkedList,
      todoModel: todoModel ?? this.todoModel,
    );
  }

  @override
  List<Object> get props => [
        isDragging,
        dragIndex,
        todos,
        dragTodo,
        isChecked,
        todoList,
        checkedList,
        todoModel
      ];
}
