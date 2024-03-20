import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/filters_model.dart';
import 'package:unify/utils/theme/theme.dart';
import 'package:unify/router.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'amplifyconfiguration.dart';

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugins([AmplifyAuthCognito(), AmplifyStorageS3()]);

// call Amplify.configure to use the initialized categories in your app

    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred configuring Amplify: $e');
  }
}

void main() async {
  await dotenv.load(fileName: "../.env"); // Load the .env file
  await _configureAmplify();
  runApp(const Unify());
}

class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showSnackBar({required String content}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(content)));
  }
}

class Unify extends StatelessWidget {
  const Unify({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FiltersModel(),
      child: MaterialApp.router(
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
      ),
    );
  }
}
