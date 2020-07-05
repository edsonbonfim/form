import 'package:example/controllers/auth_controller.dart';
import 'package:example/pages/custom_error_text/custom_error_text_page.dart';
import 'package:example/pages/custom_validator/custom_validator_page.dart';
import 'package:example/pages/home/home_page.dart';
import 'package:example/pages/input_listener/input_listener_page.dart';
import 'package:example/pages/input_text/input_text_page.dart';
import 'package:example/pages/login/login_page.dart';
import 'package:example/pages/text_editing_controller/text_editing_controller_page.dart';
import 'package:example/pages/validate_form/validate_form.dart';
import 'package:example/pages/validate_input/validate_input.dart';
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
