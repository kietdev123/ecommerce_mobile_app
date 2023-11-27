import 'package:ecommerce_mobile_app/bloc/counter/counter_bloc.dart';
import 'package:ecommerce_mobile_app/bloc/state_observer.dart';
import 'package:ecommerce_mobile_app/views/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const StateObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
          ),
        ],
        child: CounterView(),
      ),
    );
  }
}
