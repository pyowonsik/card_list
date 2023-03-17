import 'package:card_list/card/card_model.dart';

class CardListState {
  final bool isDragging;
  final int dragIndex;
  final String dragTodo;
  final List<CardModel> cardList;
  final List<CardModel> searchList;

  const CardListState({
    required this.isDragging,
    required this.dragIndex,
    required this.dragTodo,
    required this.cardList,
    required this.searchList,
  });

  CardListState copyWith({
    bool? isDragging,
    int? dragIndex,
    String? dragTodo,
    List<CardModel>? cardList,
    List<CardModel>? searchList,
  }) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      dragTodo: dragTodo ?? this.dragTodo,
      cardList: cardList ?? this.cardList,
      searchList: searchList ?? this.searchList,
    );
  }
}
