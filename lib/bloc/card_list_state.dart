import 'package:card_list/todo/todo.dart';
import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final bool isDragging;
  final int dragIndex;
  final String dragTodo;
  final List<Todo> cardList;
  final List<Todo> checkedCardList;
  final List<Todo> unCheckedCardList;

  const CardListState({
    required this.isDragging,
    required this.dragIndex,
    required this.dragTodo,
    required this.cardList,
    required this.checkedCardList,
    required this.unCheckedCardList,
  });

  CardListState copyWith({
    bool? isDragging,
    int? dragIndex,
    String? dragTodo,
    List<Todo>? cardList,
    List<Todo>? checkedCardList,
    List<Todo>? unCheckedCardList,
  }) {
    return CardListState(
      isDragging: isDragging ?? this.isDragging,
      dragIndex: dragIndex ?? this.dragIndex,
      dragTodo: dragTodo ?? this.dragTodo,
      cardList: cardList ?? this.cardList,
      checkedCardList: checkedCardList ?? this.checkedCardList,
      unCheckedCardList: unCheckedCardList ?? this.unCheckedCardList,
    );
  }

  @override
  List<Object> get props => [
        isDragging,
        dragIndex,
        dragTodo,
        cardList,
        checkedCardList,
        unCheckedCardList
      ];
}
