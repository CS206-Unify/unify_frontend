import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/authentication.dart';
import 'package:unify/data/unify-spring/serializers/authentication/login_serializer.dart';
import 'package:unify/model/profile/login_model.dart';
import 'package:unify/widgets/profile/button/routing_buttons.dart';
import 'package:unify/widgets/profile/custom_shapes/login_bg.dart';
import 'package:unify/widgets/profile/form/login_form.dart';
import 'package:unify/widgets/profile/image/app_icon_large.dart';
import 'package:unify/widgets/profile/text/introduce_text.dart';
import 'package:unify/widgets/profile/text/question_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.surface,
        child: CustomPaint(
          painter: LoginBgPaint(
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Scaffold(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(32, 20, 32, 20),
                child: ChangeNotifierProvider(
                  create: (context) => LoginModel(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const IntroText(text: "Welcome back to Unify!"),
                        const AppIconLarge(),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.fromLTRB(20, 108, 20, 36),
                          child: const LoginForm(),
                        ),
                        Wrap(
                          runSpacing: 16,
                          children: [
                            Center(
                              child: Consumer<LoginModel>(
                                  builder: (context, formValues, child) =>
                                      FilledButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            login(LoginRequest(
                                                username: formValues.getUsername,
                                                password: formValues.getPassword));
                                          }
                                        },
                                        child: const Text("Login"),
                                      )),
                            ),
                            const Divider(),
                            const QuestionText(text: "New to Unify?"),
                            const RoutingButton(text: "Register", location: "/")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
