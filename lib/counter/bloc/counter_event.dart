part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementRequested extends CounterEvent {}

class CounterDecrementRequested extends CounterEvent {}