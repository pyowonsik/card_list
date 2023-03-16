import 'package:card_list/card/card_model.dart';
import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final bool isDragging;
  final int dragIndex;
  final String dragTodo;
  final List<CardModel> cardList;

  const CardListState(
      {required this.isDragging,
      required this.dragIndex,
      required this.dragTodo,
      required this.cardList});

  CardListState copyWith(
      {bool? isDragging,
      int? dragIndex,
      String? dragTodo,
      List<CardModel>? cardList,
      String? searchText}) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      dragTodo: dragTodo ?? this.dragTodo,
      cardList: cardList ?? this.cardList,
    );
  }

  @override
  List<Object> get props => [isDragging, dragIndex, dragTodo, cardList];
}
