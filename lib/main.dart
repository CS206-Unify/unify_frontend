import 'package:flutter/material.dart';
import 'package:unify/utils/theme/theme.dart';
import 'package:unify/router.dart';

void main() async {
  runApp(const Unify());
}

class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showSnackBar({required String content}){
    scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(content)));
  }
}

class Unify extends StatelessWidget {
  const Unify({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: SnackBarService.scaffoldKey,
      title: 'Unify',
      debugShowCheckedModeBanner: false,
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
