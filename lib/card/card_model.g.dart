// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardModel _$$_CardModelFromJson(Map<String, dynamic> json) => _$_CardModel(
      card: json['card'] as String,
      isChecked: json['isChecked'] as bool,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$_CardModelToJson(_$_CardModel instance) =>
    <String, dynamic>{
      'card': instance.card,
      'isChecked': instance.isChecked,
      'time': instance.time.toIso8601String(),
    };
