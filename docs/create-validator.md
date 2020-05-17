# Create your own Validator

Form provides dozens of `Validators` ready to use, however, in some cases it is necessary to create a custom validation rule.

> Stay tuned to the [list](list-validators.md) of `Validators` to see all available options.

In this example, learn how to create and use one `Validator` that checks if you `Input` have the word `"form"` using the following steps:

1. Create a class that extends `Validator`.
2. Implement the `validate()` method.
3. Define an error message.
4. Use `Validator` in an `Input`

> This functionality is available in the form using `Validators.contains(["form"])`, but we will use this example due to the difficulty of finding validation logic that is not yet available in the form.

#### 1. Create a class that extends Validator.

```dart
class MyCustomValidator extends Validator {}
```

#### 2. Implement the validate() method.

```dart
class MyCustomValidator extends Validator {
  @override
  bool validate(String str) => str.contains("form");
}
```

#### 3. Define an error message.

```dart
class MyCustomValidator extends Validator {
  @override
  bool validate(String str) => str.contains("form");

  @override
  String get errorText => 'This field should contains the "form" word';
}
```

#### 4. Use the Validator on an Input

```dart
Input(
  "input",
  validators: [
    MyCustomValidator(),
  ],
);
```