// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todo: json['todo'] as String,
      isChecked: json['isChecked'] as bool,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'todo': instance.todo,
      'isChecked': instance.isChecked,
      'time': instance.time.toIso8601String(),
    };
