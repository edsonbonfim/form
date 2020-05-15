# Retrieve error message

In some cases, it is necessary to obtain the error message after validating a form or input. In this example, learn how to retrieve and display the error message on the console.

> When a form or input is validated, form takes care of showing the error message automatically.

First, let's create a text field for an email address.

```dart
Input(
  "email",
  validators: [Validators.email],
);
```

Now let's validate the input. If the email entered by the user is not valid, we display the error message on the console.

```dart
if (!Input.get("email").validate()) {
  print(Input.get("email").errorText);
}
```
