import 'package:bloc_practice/counter/bloc/counter_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(): super(CounterInitial()) {
    on<CounterIncrementRequested>(_onCounterIncrement);
    on<CounterDecrementRequested>(_onCounterDecrement);
  }

  void _onCounterIncrement(CounterIncrementRequested event, Emitter<CounterState> emit) {
    emit(CounterUpdated(state.count + 1));
  }

  void _onCounterDecrement(CounterDecrementRequested event, Emitter<CounterState> emit) {
    emit(CounterUpdated(state.count - 1));
  }
}