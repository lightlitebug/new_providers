import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterStateProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text('StateProvider')),
      body: Center(
        child: Text(
          '${counter.state}',
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
              onPressed: () => counter.state++,
              heroTag: null,
            ),
            SizedBox(width: 10.0),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => counter.state--,
              heroTag: null,
            ),
          ],
        ),
      ),
    );
  }
}
