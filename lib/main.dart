import 'package:bloc_practice/counter/counter_cubit.dart';
import 'package:bloc_practice/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => CounterCubit(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(child: CounterScreen()));
  }
}
