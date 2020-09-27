import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterStateProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(counterStateProvider).state;

    return Scaffold(
      appBar: AppBar(title: Text('StateProvider')),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => context.read(counterStateProvider).state++,
              heroTag: null,
            ),
            SizedBox(width: 10.0),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => context.read(counterStateProvider).state--,
              heroTag: null,
            ),
          ],
        ),
      ),
    );
  }
}
