// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoListState _$$_TodoListStateFromJson(Map<String, dynamic> json) =>
    _$_TodoListState(
      isDragging: json['isDragging'] as bool,
      dragIndex: json['dragIndex'] as int,
      dragTodo: json['dragTodo'] as String,
      todoList: (json['todoList'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchList: (json['searchList'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TodoListStateToJson(_$_TodoListState instance) =>
    <String, dynamic>{
      'isDragging': instance.isDragging,
      'dragIndex': instance.dragIndex,
      'dragTodo': instance.dragTodo,
      'todoList': instance.todoList,
      'searchList': instance.searchList,
    };
