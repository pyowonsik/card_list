import 'package:bloc_extends_counter/src/app.dart';
import 'package:bloc_extends_counter/src/bloc/counter_bloc.dart';
import 'package:bloc_extends_counter/src/cal/bloc/cal_bloc.dart';
import 'package:bloc_extends_counter/src/cal/screen/cal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>CalBloc(),
        child: const CalScreen(),
      ),
    );
  }
}
