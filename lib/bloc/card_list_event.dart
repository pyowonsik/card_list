import 'package:card_list/card/card_model.dart';
import 'package:equatable/equatable.dart';

abstract class CardListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddCardEvent extends CardListEvent {
  final String card;
  AddCardEvent({required this.card});
  @override
  List<Object> get props => [card];
}

class RemoveCardEvent extends CardListEvent {
  final DateTime time;
  RemoveCardEvent({required this.time});
  @override
  List<Object> get props => [time];
}

class ChangeCardNameEvent extends CardListEvent {
  final String card;
  final DateTime time;
  ChangeCardNameEvent({required this.card, required this.time});
  @override
  List<Object> get props => [card, time];
}

class CheckCardEvent extends CardListEvent {
  final DateTime time;
  CheckCardEvent({required this.time});

  @override
  List<Object> get props => [time];
}

class SearchCardEvent extends CardListEvent {
  final String cardName;
  final List<CardModel> cardModel;
  SearchCardEvent({required this.cardName, required this.cardModel});
  @override
  List<Object> get props => [cardName, cardModel];
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
