import 'package:flutter/material.dart';
import 'package:form/form.dart';

class InputTextPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Input text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Input(
                tag: "name",
                decoration: InputDecoration(
                  hintText: "Input some text...",
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      child: Text("Enter"),
                      onPressed: () {
                        scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                              Input.get("name").text,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
