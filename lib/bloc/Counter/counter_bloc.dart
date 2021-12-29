import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterEventInc) {
        emit(CounterState(counter: state.counter! + 1));
      } else if (event is CounterEventDec) {
        emit(CounterState(counter: state.counter! - 1));
      }
    });
  }
}
