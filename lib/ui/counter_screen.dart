import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_pattern_with_bloc/bloc/counter/counter_bloc.dart';
import 'package:flutter_clean_pattern_with_bloc/bloc/counter/counter_event.dart';
import 'package:flutter_clean_pattern_with_bloc/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have Increased and Decreased the button many times',
            ),
            const SizedBox(
              height: 20,
            ),

            BlocBuilder<CounterBloc,CounterState>(
                builder: (context ,state){
              return Text(
                state.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),


            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: const Text(
                      "Increment",
                      style: TextStyle(fontSize: 18),
                    )),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: const Text(
                      "Decrement",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
