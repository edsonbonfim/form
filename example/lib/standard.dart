import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  final usernameKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();

  TextEditingController username;
  TextEditingController password;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            key: usernameKey,
            controller: username,
            validator: (value) {
              if (value.isEmpty) {
                return "This field is required";
              }
              if (value.length < 6) {
                return "Please lengthen this text to 6 characters or more";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Username",
            ),
          ),
          TextFormField(
            key: passwordKey,
            controller: password,
            validator: (value) {
              if (value.isEmpty) {
                return "This field is required";
              }

              String regex = r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$";

              if (!RegExp(regex).hasMatch(value)) {
                return "Your password must be have at least 8 characters long, 1 uppercase & 1 lowercase character and 1 number";
              }

              return null;
            },
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {
              if (formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Logged")),
                );
                print(username.text);
                print(password.text);
              } else {
                print(usernameKey.currentState.errorText);
                print(passwordKey.currentState.errorText);
              }
            },
          ),
        ],
      ),
    );
  }
}
