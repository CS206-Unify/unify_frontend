import 'package:flutter/material.dart';
import 'package:unify/utils/theme/theme.dart';
import 'package:unify/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Unify',
      darkTheme: ThemeData.from(
          colorScheme: const MaterialTheme().dark().colorScheme,
          textTheme: const MaterialTheme().text()),
      theme: ThemeData.from(
          colorScheme: const MaterialTheme().light().colorScheme,
          textTheme: const MaterialTheme().text()),
      themeMode: ThemeMode.system,
      routerConfig: router,      
    );
  }
}
