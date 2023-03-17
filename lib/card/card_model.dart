import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  final String card;
  final bool isChecked;
  final DateTime time;

  const CardModel({
    required this.card,
    required this.isChecked,
    required this.time,
  });

  @override
  List<Object> get props => [card, isChecked, time];
}
