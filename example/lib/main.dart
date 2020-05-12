import 'package:example/strong_password_validator.dart';
import 'package:flutter/material.dart';
import 'package:form/form.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FormController form;
  InputController username;
  InputController password;

  @override
  void initState() {
    super.initState();

    form = FormController();

    username = InputController(
      autovalidate: true,
      validators: [
        Validators.minLength(6),
      ],
    );

    password = InputController(validators: [
      StrongPasswordValidator(),
    ]);
  }

  @override
  void dispose() {
    password.dispose();
    username.dispose();
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormInput(
      controller: form,
      child: Column(
        children: [
          Input(
            controller: username,
            decoration: InputDecoration(
              labelText: "Username",
            ),
          ),
          Input(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: submit,
                  child: Text("Login"),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: form.reset,
                  child: Text("Reset"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void submit() async {
    if (await form.validate()) {
      form.reset();
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text("Submitted"),
        ));
    } else {
      if (username.hasError) print(username.errorText);
      if (password.hasError) print(password.errorText);
    }
  }
}
