import 'dart:math';

import 'package:bloc_extends_counter/src/cal/bloc/cal_bloc.dart';
import 'package:bloc_extends_counter/src/cal/bloc/cal_event.dart';
import 'package:bloc_extends_counter/src/cal/bloc/cal_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var numberA = 10;
var numberB = 20;
dynamic operation = '';

class CalScreen extends StatelessWidget {
  const CalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CalBloc, CalState>(builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.numberA.toString()),
                SizedBox(width: 30),
                Text(state.numberB.toString()),
                Text(' = '),
                Text(state.result.toString()),
              ],
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CalBloc>().add(ChangeAEvent(1));
                  },
                  child: Text('1')),
              ElevatedButton(
                  onPressed: () {
                    numberB = 2;
                  },
                  child: Text('2')),
              ElevatedButton(
                  onPressed: () {
                    numberB = 3;
                  },
                  child: Text('3')),
              ElevatedButton(
                  onPressed: () {
                    operation = Operation.plus;
                  },
                  child: Text('+')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CalBloc>().add(ZeroEvent());
                  },
                  child: Text('zero')),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CalBloc>()
                        .add(SubmitEvent(operation, numberA, numberB));
                  },
                  child: Text('계산하기')),
            ],
          ),
        ],
      ),
    );
  }
}
