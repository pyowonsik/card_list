import 'package:equatable/equatable.dart';

abstract class CardListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddNumberEvent extends CardListEvent {
  final int index;
  AddNumberEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class AddIndexEvent extends CardListEvent {
  @override
  List<Object> get props => [];
}

class RemoveIndexEvent extends CardListEvent {
  final int index;
  RemoveIndexEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class DragInfoEvent extends CardListEvent {
  final int index;
  DragInfoEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class DragEvent extends CardListEvent {
  final int index;

  DragEvent({required this.index});

  @override
  List<Object> get props => [index];
}
