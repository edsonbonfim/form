import 'package:flutter/material.dart';
import 'package:form/form.dart';

class InputListenerPage extends StatefulWidget {
  @override
  _InputListenerPageState createState() => _InputListenerPageState();
}

class _InputListenerPageState extends State<InputListenerPage> {
  String text1 = "";
  String text2 = "";

  @override
  void initState() {
    super.initState();
    // TODO: Alterar a documentação
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      Input.get("name").addListener(listener);
    });
  }

  @override
  void dispose() {
    Input.get("name").removeListener(listener);
    Input.get("name").dispose();
    super.dispose();
  }

  void listener() {
    text2 = Input.get('name').text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input listener"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input
              Input(
                "name",
                decoration: InputDecoration(
                  hintText: "Input some text...",
                ),
                onChanged: (text) {
                  setState(() => text1 = text);
                },
              ),

              // onChange
              SizedBox(height: 18.0),
              Text("onChange:"),
              SizedBox(height: 8.0),
              Text(text1.isNotEmpty ? text1 : "..."),

              // addListener
              SizedBox(height: 18.0),
              Text("addListener:"),
              SizedBox(height: 8.0),
              Text(text2.isNotEmpty ? text2 : "..."),

              // InputText widget
              SizedBox(height: 18.0),
              Text("InputText widget:"),
              SizedBox(height: 8.0),
              InputText("name", defaultValue: "..."),
            ],
          ),
        ),
      ),
    );
  }
}
