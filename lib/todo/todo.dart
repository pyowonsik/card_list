import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Todo extends Equatable {
  final String todo;
  final bool isChecked;
  final DateTime time;

  const Todo({
    required this.todo,
    required this.isChecked,
    required this.time,
  });

  @override
  List<Object> get props => [todo, isChecked, time];
}
