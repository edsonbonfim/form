import 'package:flutter/material.dart';

import 'form_controller.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    Key key,
    @required this.controller,
    this.child,
  })  : assert(controller != null),
        super(key: key);

  final FormController controller;
  final Widget child;

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) => widget.child;
}
