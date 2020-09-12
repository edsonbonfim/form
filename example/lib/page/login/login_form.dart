import 'package:flutter/material.dart';
import 'package:form/form.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final auth = authController.auth;

    return FormInput(
      auth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Input(
            auth.username,
            decoration: InputDecoration(hintText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          Input(
            auth.password,
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
          ),
          SizedBox(height: 20),
          RaisedButton(
            onPressed: authController.login,
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
