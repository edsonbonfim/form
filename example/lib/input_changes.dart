import 'package:flutter/material.dart';
import 'package:form/form.dart';

class InputChangesForm extends StatefulWidget {
  @override
  _InputChangesFormState createState() => _InputChangesFormState();
}

class _InputChangesFormState extends State<InputChangesForm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      Input.get("search").addListener(_printLatestValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormInput(
      tag: "changes",
      child: Column(
        children: [
          Input(
            onChanged: (text) {
              print("First input: $text");
            },
          ),
          Input(tag: "search"),
        ],
      ),
    );
  }

  _printLatestValue(String text) {
    print("Second input: $text");
  }
}
