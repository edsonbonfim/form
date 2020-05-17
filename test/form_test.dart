import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:form/form.dart';

void main() {
  testWidgets("Default input text", (WidgetTester tester) async {
    await tester.pumpWidget(Base(Input("input")));
    expect('', Input.get("input").text);
  });

  testWidgets("Input text", (WidgetTester tester) async {
    await tester.pumpWidget(Base(Input("input")));

    await tester.enterText(find.byType(Input), "hi");

    expect("hi", Input.get("input").text);

    expect(find.text("hi"), findsOneWidget);
  });

  testWidgets("validate input", (WidgetTester tester) async {
    await tester.pumpWidget(Base(Input(
      "input",
      validators: [Validators.required],
    )));

    expect(false, Input.get("input").validate());

    await tester.enterText(find.byType(Input), " ");
    expect(false, Input.get("input").validate());

    await tester.enterText(find.byType(Input), "hi");
    expect(true, Input.get("input").validate());
  });

  testWidgets("input error text", (WidgetTester tester) async {
    await tester.pumpWidget(Base(Input(
      "input",
      validators: [Validators.required],
    )));

    expect(null, Input.get("input").errorText);

    Input.get("input").validate();

    expect("This field is required", Input.get("input").errorText);
  });
}

class Base extends StatelessWidget {
  final Widget child;

  const Base(this.child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: child,
      ),
    );
  }
}
