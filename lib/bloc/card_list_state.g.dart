// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardListState _$$_CardListStateFromJson(Map<String, dynamic> json) =>
    _$_CardListState(
      isDragging: json['isDragging'] as bool,
      dragIndex: json['dragIndex'] as int,
      dragTodo: json['dragTodo'] as String,
      cardList: (json['cardList'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchList: (json['searchList'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CardListStateToJson(_$_CardListState instance) =>
    <String, dynamic>{
      'isDragging': instance.isDragging,
      'dragIndex': instance.dragIndex,
      'dragTodo': instance.dragTodo,
      'cardList': instance.cardList,
      'searchList': instance.searchList,
    };
