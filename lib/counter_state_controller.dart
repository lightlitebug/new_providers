import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterController extends StateController<int> {
  CounterController() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final counterStateControllerProvider =
    StateNotifierProvider<CounterController>((_) {
  return CounterController();
});

class CounterStateControllerProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(counterStateControllerProvider.state);
    final counterObj = watch(counterStateControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text('StateController')),
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
                  context.read(counterStateControllerProvider).increment(),
              heroTag: null,
            ),
            SizedBox(width: 10.0),
            FloatingActionButton(
              child: Icon(Icons.thumb_up),
              onPressed: () {
                counterObj.state = counterObj.state + 10;
              },
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
