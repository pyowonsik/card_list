import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  final String todo;
  final bool isChecked;
  final DateTime time;

  const CardModel({
    required this.todo,
    required this.isChecked,
    required this.time,
  });

  @override
  List<Object> get props => [todo, isChecked, time];
}
