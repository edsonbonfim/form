import 'package:example/controllers/auth_controller.dart';
import 'package:example/pages/home/home_page.dart';
import 'package:example/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<bool>(
        valueListenable: Provider.of<AuthController>(context).isLogged,
        builder: (_, isLogged, __) {
          if (isLogged) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
