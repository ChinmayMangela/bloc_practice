part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {}

final class CounterIncrementPressed extends CounterEvent {

  @override
  List<Object?> get props => [];
}


final class CounterDecrementPressed extends CounterEvent {

  @override
  List<Object?> get props => [];
}