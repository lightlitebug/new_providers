import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:state_notifier/state_notifier.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final counterStateNotifierProvider = StateNotifierProvider<Counter>((_) {
  return Counter();
});

class CounterStateNotifierProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(counterStateNotifierProvider.state);
    final counterObj = watch(counterStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('StateNotifierProvider')),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () =>
                  context.read(counterStateNotifierProvider).increment(),
              heroTag: null,
            ),
            SizedBox(width: 10.0),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => counterObj.decrement(),
              heroTag: null,
            ),
          ],
        ),
      ),
    );
  }
}
