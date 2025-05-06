import 'package:bloc_practice/counter/counter_cubit.dart';
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
      child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        return Text('$state');
      }),
    );
  }
  
  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      context.read<CounterCubit>().increment();
    }, child: Text('+'),);
  }
}
