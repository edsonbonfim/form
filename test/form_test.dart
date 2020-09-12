import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:form/form.dart';

void main() {
  testWidgets("validate", (var tester) async {
    await tester.pumpWidget(Base(Input(
      'name',
      validators: [Validators.required],
    )));

    expect(false, Input.get('name').validate());

    await tester.enterText(find.byType(Input), " ");
    expect(false, Input.get('name').validate());

    await tester.enterText(find.byType(Input), "some name");
    expect(true, Input.get('name').validate());
  });

  testWidgets("errorText", (var tester) async {
    await tester.pumpWidget(Base(Input(
      "name",
      validators: [Validators.required],
    )));

    expect(null, Input.get("name").errorText);

    Input.get("name").validate();

    expect(Validators.required.errorText, Input.get("name").errorText);
  });

  testWidgets('controller', (var tester) async {
    final controller = TextEditingController(text: 'initial value');

    await tester.pumpWidget(Base(Input(
      'name',
      controller: controller,
    )));

    expect(controller, Input.get('name').controller);
    expect('initial value', Input.get('name').text);
  });

  testWidgets('initialValue', (var tester) async {
    await tester.pumpWidget(Base(Input(
      'name',
      initialValue: 'initial value',
    )));

    expect('initial value', Input.get('name').text);
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
