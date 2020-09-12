import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/auth_controller.dart';
import 'page/home/home_page.dart';
import 'page/login/login_page.dart';

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
