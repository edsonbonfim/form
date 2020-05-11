import 'package:flutter/material.dart';
import 'package:form/form.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Form")),
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
  final form = GlobalKey<FormState>();

  TextEditingController username;
  TextEditingController password;

  @override
  void initState() {
    super.initState();

    username = TextEditingController()
      ..validators({
        Validators.required: "This field is required",
        Validators.minLength(6):
            "This field should not have less than 6 characters",
      });

    password = TextEditingController()
      ..validators({
        Validators.required: "This field is required",
        Validators.minLength(6):
            "This field should not have less than 6 characters",
      });
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: form,
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
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(height: 16),
            RaisedButton(
              onPressed: submit,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    if (form.validate()) {
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
