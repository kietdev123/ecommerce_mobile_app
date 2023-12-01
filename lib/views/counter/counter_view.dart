import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_mobile_app/bloc/counter/counter_bloc.dart';
import 'package:ecommerce_mobile_app/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('${state.countValue}',
                    style: textTheme.displayMedium);
              },
            ),
          ),
          Text(AppLocalizations.of(context)!.hello),
          Text(AdaptiveTheme.of(context).mode.isDark ? 'dark' : 'light'),
          Switch(
            value: AdaptiveTheme.of(context).mode.isDark,
            onChanged: (value) {
              if (value) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterBloc>().add(IncreaseCounter()),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterBloc>().add(DecreaseCounter()),
          ),
          FloatingActionButton(
            child: Text('add user firebase'),
            onPressed: () async {
              FirebaseFirestore.instance
                  .collection('users')
                  .add({
                    'full_name': 'a', // John Doe
                    'company': 'b', // Stokes and Sons
                    'age': 'c' // 42
                  })
                  .then((value) => print("User Added"))
                  .catchError((error) => print("Failed to add user: $error"));
            },
          ),
        ],
      ),
    );
  }
}
