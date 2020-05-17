# Customize error message

You can customize the error message on each `Input` using the `Validator.msg()` method.

```dart
Input(
  "email",
  validators: [
    Validators.email..msg("This field should contains a valid email address"),
  ],
),
```

> It would be interesting to be able to change a validator's message globally. [Contributions](https://github.com/edsonbonfim/form/fork) are welcome.