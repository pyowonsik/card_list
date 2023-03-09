import 'package:equatable/equatable.dart';

abstract class CardListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddCardNumberEvent extends CardListEvent {
  final int index;
  AddCardNumberEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class AddCardEvent extends CardListEvent {
  @override
  List<Object> get props => [];
}

class RemoveIndexEvent extends CardListEvent {
  final int index;
  RemoveIndexEvent({required this.index});
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
