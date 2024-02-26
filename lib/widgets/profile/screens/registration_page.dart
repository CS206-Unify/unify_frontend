import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/profile/registration_model.dart';
import 'package:unify/widgets/profile/button/routing_buttons.dart';
import 'package:unify/widgets/profile/custom_shapes/registration_bg.dart';
import 'package:unify/widgets/profile/form/registration_form.dart';
import 'package:unify/widgets/profile/image/app_icon_large.dart';
import 'package:unify/widgets/profile/text/introduce_text.dart';
import 'package:unify/widgets/profile/text/question_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.surface,
        child: CustomPaint(
            painter: RegistrationBgPaint(
                color: Theme.of(context).colorScheme.onSecondary),
            child: Scaffold(
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              body: SingleChildScrollView(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(32, 20, 32, 20),
                child: ChangeNotifierProvider(
                  create: (context) => RegistrationModel(),
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        const IntroText(
                          text:
                              "Join us in the journey of Competitive & Collaborative Mobile Esports",
                        ),
                        const AppIconLarge(),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: const RegistrationForm(),
                        ),
                        Wrap(
                          runSpacing: 16,
                          children: [
                            Center(
                              child: FilledButton(
                                  onPressed: () {
                                    _formKey.currentState!.validate();
                                  },
                                  child: const Text("Register")),
                            ),
                            const Divider(),
                            const QuestionText(
                                text: "Already have an account?"),
                            const RoutingButton(
                                text: "Login", location: "/login")
                          ],
                        )
                      ])),
                ),
              )),
            )));
  }
}
