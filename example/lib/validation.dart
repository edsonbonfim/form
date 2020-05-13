import 'package:flutter/material.dart';
import 'package:form/form.dart';

// Define a custom FormInput widget.
class ValidationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build a FormInput widget.
    return FormInput(
      // This tag uniquely identifies the FormInput
      // widget and allows validation of the form.
      tag: "validationForm",
      child: Column(
        children: <Widget>[
          Input(
            validators: [
              Validators.required,
            ],
          ),
          RaisedButton(
            onPressed: () {
              // validate returns true if the form is valid, otherwise false.
              if (FormInput.get("validationForm").validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
