import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final bool isDragging;
  final int dragIndex;
  final List<String> todos;
  final String dragTodo;
  final bool isChecked;

  const CardListState({
    required this.isDragging,
    required this.dragIndex,
    required this.todos,
    required this.dragTodo,
    required this.isChecked,
  });

  CardListState copyWith({
    bool? isDragging,
    int? dragIndex,
    List<String>? todos,
    String? dragTodo,
    bool? isChecked,
  }) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      todos: todos ?? this.todos,
      dragTodo: dragTodo ?? this.dragTodo,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object> get props => [isDragging, dragIndex, todos, dragTodo, isChecked];
}
