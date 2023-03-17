import 'package:card_list/card/card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_list_state.freezed.dart';
part 'card_list_state.g.dart';

@freezed
class CardListState with _$CardListState {
  factory CardListState(
      {required bool isDragging,
      required int dragIndex,
      required String dragTodo,
      required List<CardModel> cardList,
      required List<CardModel> searchList}) = _CardListState;

  factory CardListState.fromJson(Map<String, dynamic> json) =>
      _$CardListStateFromJson(json);

  // final bool isDragging;
  // final int dragIndex;
  // final String dragTodo;
  // final List<CardModel> cardList;
  // final List<CardModel> searchList;

  // const CardListState({
  //   required this.isDragging,
  //   required this.dragIndex,
  //   required this.dragTodo,
  //   required this.cardList,
  //   required this.searchList,
  // });

  // CardListState copyWith({
  //   bool? isDragging,
  //   int? dragIndex,
  //   String? dragTodo,
  //   List<CardModel>? cardList,
  //   List<CardModel>? searchList,
  // }) {
  //   return CardListState(
  //     isDragging: isDragging ?? this.isDragging,
  //     dragIndex: dragIndex ?? this.dragIndex,
  //     dragTodo: dragTodo ?? this.dragTodo,
  //     cardList: cardList ?? this.cardList,
  //     searchList: searchList ?? this.searchList,
  //   );
  // }
}
