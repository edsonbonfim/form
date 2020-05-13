import 'package:flutter/material.dart';

import 'login_form.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: LoginForm(),
      ),
    );
  }
}
