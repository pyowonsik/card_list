import 'package:card_list/model/card_model.dart';
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
}
