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
  final String id;
  RemoveTodoEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class ChangeTodoEvent extends CardListEvent {
  final String todo;
  final String id;
  ChangeTodoEvent({required this.todo, required this.id});
  @override
  List<Object> get props => [todo, id];
}

class CheckTodoEvent extends CardListEvent {
  final String id;
  CheckTodoEvent({required this.id});

  @override
  List<Object> get props => [id];
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
