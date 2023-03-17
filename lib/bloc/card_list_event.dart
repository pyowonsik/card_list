import 'package:card_list/card/card_model.dart';

abstract class CardListEvent {}

class AddCardEvent extends CardListEvent {
  final String card;
  AddCardEvent({required this.card});
}

class RemoveCardEvent extends CardListEvent {
  final DateTime time;
  RemoveCardEvent({required this.time});
}

class ChangeCardNameEvent extends CardListEvent {
  final String card;
  final DateTime time;
  ChangeCardNameEvent({required this.card, required this.time});
}

class CheckCardEvent extends CardListEvent {
  final DateTime time;
  CheckCardEvent({required this.time});
}

class SearchCardEvent extends CardListEvent {
  final String cardName;
  final List<CardModel> cardModel;
  SearchCardEvent({required this.cardName, required this.cardModel});
}

class DragStartEvent extends CardListEvent {
  final int index;
  DragStartEvent({required this.index});
}

class DragEndEvent extends CardListEvent {}

class DragEvent extends CardListEvent {
  final int index;

  DragEvent({required this.index});
}
