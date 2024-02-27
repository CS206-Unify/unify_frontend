import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/profile/login_model.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: Consumer<LoginModel>(builder: (context, formValues, child) {
        return Wrap(runSpacing: 16, children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: "Username", labelText: "Username", filled: true),
            validator: (value) {
              return value == null || value.isEmpty
                  ? "Please enter your username"
                  : null;
            },
            onChanged: (val) => {formValues.setUsername(val)},
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
                  ? "Please enter your password"
                  : null;
            },
            onChanged: (val) => {formValues.setPassword(val)},
          ),
        ]);
      }),
    );
  }
}
