import 'package:flutter/material.dart';
import 'package:form/form.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormInput(
      tag: "login",
      child: Column(
        children: [
          Input(
            tag: "username",
            validators: [
              Validators.required,
              Validators.minLength(6),
            ],
            decoration: const InputDecoration(
              labelText: "Username",
            ),
          ),
          Input(
            tag: "password",
            validators: [
              Validators.required,
              Validators.strongPassword(),
            ],
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            child: Text("login"),
            onPressed: () => _login(context),
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    if (FormInput.get("login").validate()) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("Logged")),
      );
      print(Input.get("username").text);
      print(Input.get("password").text);
    } else {
      print(Input.get("username").errorText);
      print(Input.get("password").errorText);
    }
  }
}
