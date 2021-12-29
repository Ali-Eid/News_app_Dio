part of 'counter_bloc.dart';

@immutable
class CounterState {
  int? counter;
  CounterState({this.counter});
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0);
}

// class CounterIncrementState extends CounterState {
//   int? counter;
//   CounterIncrementState({required this.counter});
// }

// class CounterDecrementState extends CounterState {
//   int? counter;

//   CounterDecrementState({required this.counter});
// }
