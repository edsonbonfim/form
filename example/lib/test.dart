import 'package:flutter/material.dart';
import 'package:form/form.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Input("email"),
        SizedBox(height: 20),
        InputText("email"),
      ],
    );
  }
}
