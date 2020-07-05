import 'package:flutter/material.dart';
import 'package:form/form.dart';

class TextEditingControllerPage extends StatefulWidget {
  @override
  _TextEditingControllerPageState createState() =>
      _TextEditingControllerPageState();
}

class _TextEditingControllerPageState extends State<TextEditingControllerPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(inputListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void inputListener() {
    print(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextEditingController"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Input(
                tag: "name",
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Input some text...",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
