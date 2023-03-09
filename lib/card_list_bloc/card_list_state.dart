import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final List<int> numbers;
  final bool isDragging;
  final int dragNumber;
  final int dragIndex;
  final String todo;
  final List<String> todos;

  const CardListState({
    required this.numbers,
    required this.isDragging,
    required this.dragNumber,
    required this.dragIndex,
    required this.todo,
    required this.todos,
  });

  CardListState copyWith({
    List<int>? numbers,
    bool? isDragging,
    int? dragNumber,
    int? dragIndex,
    String? todo,
    List<String>? todos,
  }) {
    return CardListState(
      numbers: numbers ?? this.numbers,
      isDragging: isDragging ?? this.isDragging,
      dragNumber: dragNumber ?? this.dragNumber,
      dragIndex: dragIndex ?? this.dragIndex,
      todo: todo ?? this.todo,
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [numbers, isDragging, dragNumber, dragIndex, todo];
}
