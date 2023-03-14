import 'package:card_list/todo/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CardListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddTodoEvent extends CardListEvent {
  final String todo;
  AddTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class RemoveTodoEvent extends CardListEvent {
  final int index;
  RemoveTodoEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class ChangeTodoEvent extends CardListEvent {
  final String todo;
  final int index;
  ChangeTodoEvent({required this.todo, required this.index});
  @override
  List<Object> get props => [todo];
}

class CheckTodoEvent extends CardListEvent {
  final int index;
  CheckTodoEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class DragStartEvent extends CardListEvent {
  final int index;
  DragStartEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class DragEndEvent extends CardListEvent {
  @override
  List<Object> get props => [];
}

class DragEvent extends CardListEvent {
  final int index;

  DragEvent({required this.index});

  @override
  List<Object> get props => [index];
}
