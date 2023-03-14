import 'package:card_list/todo/todo.dart';
import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final bool isDragging;
  final int dragIndex;
  final String dragTodo;
  final List<Todo> todoModel;
  final List<Todo> checkedModel;
  final List<Todo> unCheckedModel;

  const CardListState({
    required this.isDragging,
    required this.dragIndex,
    required this.dragTodo,
    required this.todoModel,
    required this.checkedModel,
    required this.unCheckedModel,
  });

  CardListState copyWith({
    bool? isDragging,
    int? dragIndex,
    String? dragTodo,
    List<String>? todos,
    List<bool>? checked,
    List<String>? todoList,
    List<bool>? checkedList,
    List<String>? notTodoList,
    List<bool>? notCheckedList,
    List<Todo>? todoModel,
    List<Todo>? checkedModel,
    List<Todo>? unCheckedModel,
  }) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      dragTodo: dragTodo ?? this.dragTodo,
      todoModel: todoModel ?? this.todoModel,
      checkedModel: checkedModel ?? this.checkedModel,
      unCheckedModel: unCheckedModel ?? this.unCheckedModel,
    );
  }

  @override
  List<Object> get props => [
        isDragging,
        dragIndex,
        dragTodo,
        todoModel,
        checkedModel,
        unCheckedModel
      ];
}
