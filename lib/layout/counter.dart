import 'package:dip_app/bloc/Counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CounterBloc, CounterState>(listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        CounterBloc bloc = BlocProvider.of<CounterBloc>(context);

        return Center(
            child: Container(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    bloc.add(CounterEventDec());
                  },
                  icon: Icon(Icons.minimize)),
              SizedBox(
                width: 10,
              ),
              Text('${state.counter}'),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    bloc.add(CounterEventInc());
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
        ));
      }),
    );
  }
}
