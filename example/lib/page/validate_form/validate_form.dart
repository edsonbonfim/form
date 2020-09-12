import 'package:flutter/material.dart';
import 'package:form/form.dart';

class ValidateFormPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Validate form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: FormInput(
            "auth",
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Input(
                  "email",
                  decoration: InputDecoration(hintText: "Email"),
                  validators: [Validators.email],
                ),
                Input(
                  "pass",
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  validators: [Validators.minLength(6)],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        child: Text("Enter"),
                        onPressed: () {
                          if (FormInput.get("auth").validate()) {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Welcome, ${Input.get("email").text}!",
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
