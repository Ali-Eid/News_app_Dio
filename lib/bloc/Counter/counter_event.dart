part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterEventInc extends CounterEvent {}

class CounterEventDec extends CounterEvent {}
