import 'package:bloc_practice/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }
  
  Widget _buildBody() {
    return Center(
      child: BlocBuilder<CounterBloc, int>(builder: (context, state) {
        return Text('$state');
      }),
    );
  }
  
  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      // this line created the CounterIncrementPressed() event object and sends it to the CounterBloc
      // then CounterBloc receives this event object and the Bloc finds the registered handler for this event
      context.read<CounterBloc>().add(CounterIncrementPressed());
    }, child: Text('+'),);
  }
}
