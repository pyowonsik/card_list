import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String todo;
  final bool isChecked;

  const Todo({
    required this.id,
    required this.todo,
    required this.isChecked,
  });

  @override
  List<Object> get props => [id, todo, isChecked];
}
