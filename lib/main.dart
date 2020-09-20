import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:new_providers/counter_state_controller.dart';
import 'package:new_providers/counter_state_notifier_provider.dart';
import 'package:new_providers/counter_state_provider.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Providers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaisedButton(
                child: Text(
                  'StateProvider',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CounterStateProvider();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'StateNotifierProvider',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CounterStateNotifierProvider();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'StateController',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CounterStateControllerProvider();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
