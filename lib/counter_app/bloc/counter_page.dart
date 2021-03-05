import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_purposes/counter_app/bloc/counter.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: CounterScreen(),
    );
  }
}
