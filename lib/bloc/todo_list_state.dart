import 'package:todo_list/model/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_state.freezed.dart';
part 'todo_list_state.g.dart';

@freezed
class TodoListState with _$TodoListState {
  factory TodoListState(
      {required bool isDragging,
      required int dragIndex,
      required String dragTodo,
      required List<Todo> todoList,
      required List<Todo> searchList}) = _TodoListState;

  factory TodoListState.fromJson(Map<String, dynamic> json) =>
      _$TodoListStateFromJson(json);
}
