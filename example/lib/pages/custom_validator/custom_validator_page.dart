import 'package:example/pages/custom_validator/only_numbers_validator.dart';
import 'package:flutter/material.dart';
import 'package:form/form.dart';

class CustomValidatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom validator"),
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
                  hintText: "Type some numbers...",
                ),
                validators: [OnlyNumbers()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
