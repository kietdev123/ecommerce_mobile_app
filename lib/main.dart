import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ecommerce_mobile_app/L10n/L10n.dart';
import 'package:ecommerce_mobile_app/bloc/counter/counter_bloc.dart';
import 'package:ecommerce_mobile_app/bloc/state_observer.dart';
import 'package:ecommerce_mobile_app/l10n/gen/app_localizations.dart';
import 'package:ecommerce_mobile_app/views/counter/counter_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/src/widgets_localizations.dart';
import 'package:flutter_localizations/src/material_localizations.dart';
import 'package:flutter_localizations/src/cupertino_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp();
  }

  Bloc.observer = const StateObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        theme: theme,
        supportedLocales: L10N.all,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: MultiBlocProvider(
          providers: [
            BlocProvider<CounterBloc>(
              create: (BuildContext context) => CounterBloc(),
            ),
          ],
          child: CounterView(),
        ),
      ),
    );
  }
}
