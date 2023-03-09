import 'package:equatable/equatable.dart';

class CardListState extends Equatable {
  final List<int> numbers;
  final bool isDragging;
  final int dragNumber;
  final int dragIndex;

  const CardListState({
    required this.numbers,
    required this.isDragging,
    required this.dragNumber,
    required this.dragIndex,
  });

  CardListState copyWith({
    List<int>? numbers,
    bool? isDragging,
    int? dragNumber,
    int? dragIndex,
  }) {
    return CardListState(
      numbers: numbers ?? this.numbers,
      isDragging: isDragging ?? this.isDragging,
      dragNumber: dragNumber ?? this.dragNumber,
      dragIndex: dragIndex ?? this.dragIndex,
    );
  }

  @override
  List<Object> get props => [numbers, isDragging, dragNumber, dragIndex];
}
