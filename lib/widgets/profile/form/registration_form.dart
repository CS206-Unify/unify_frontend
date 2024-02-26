import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/profile/registration_model.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: Consumer<RegistrationModel>(builder: (context, formValues, child) {
        return Wrap(
          runSpacing: 16,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Username", labelText: "Username", filled: true),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please enter a username"
                    : null;
              },
              onChanged: (val) => {formValues.setUsername(val)},
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Email", labelText: "Email", filled: true),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please enter an email"
                    : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)
                        ? "Please enter a valid email"
                        : null;
              },
              onChanged: (val) => {formValues.setEmail(val)},
            ),
            TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  filled: true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(_passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined))),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please enter a password"
                    : null;
              },
              onChanged: (val) => {formValues.setPassword(val)},
            ),
          ],
        );
      }),
    );
  }
}
