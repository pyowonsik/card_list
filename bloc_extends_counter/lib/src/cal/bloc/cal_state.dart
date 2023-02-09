import 'package:equatable/equatable.dart';

enum CalStatus { init, success }

class CalState extends Equatable {
  // final CalState status;
  final int result;
  final int numberA;
  final int numberB;

  const CalState({
    // required this.status,
    required this.result,
    required this.numberA,
    required this.numberB,
  });

  CalState.init()
      : this(
          // status: CalState.init(),
          result: 0,
          numberA: 0,
          numberB: 0,
        );

  CalState copyWith({
    CalState? status,
    int? result,
    int? numberA,
    int? numberB,
  }) {
    return CalState(
      // status: status ?? this.status,
      result: result ?? this.result,
      numberA: numberA ?? this.numberA,
      numberB: numberB ?? this.numberB,
    );
  }

  List<Object> get props => [result, numberA, numberB];
}
