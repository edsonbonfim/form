import 'package:flutter/material.dart';
import 'package:form/form.dart';

class CustomErrorTextPage extends StatelessWidget {
  final customErrorMsg = "This is a custom error message!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom error text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Input(
                "email",
                autovalidate: true,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                validators: [
                  Validators.email..errorText = customErrorMsg,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
