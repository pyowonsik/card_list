import 'dart:math';

import 'package:bloc_extends_counter/src/bloc/counter_bloc.dart';
import 'package:bloc_extends_counter/src/bloc/counter_event.dart';
import 'package:bloc_extends_counter/src/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var num = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.count.toString(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecreaseEvent());
                  },
                  child: Text('-')),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(ZeroEvent());
                  },
                  child: Text('zero')),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncreaseEvent());
                  },
                  child: Text('+')),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          //
          for (var i = 1; i < num.length + 1; i++) ...[
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(ChangeEvent(i));
                },
                child: Text('$i')),
            SizedBox(
              height: 10,
            ),
          ]
          
        ],
      ),
    );
  }
}
