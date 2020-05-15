# Create an input with validation

In this example, learn how to add validation to an email input.

```dart
Input(
  "email",
  validators: [Validators.email],
),
```

Now it is enough to validate if the text entered by the user is a valid email address.

```dart
// Retorna [true] se for um email válido, caso contrário, retorna [false]
Input.get("email").validate();
```

!> Note that the the `tag` used to build the `Input` must be the same used in the method `Input.get()`. In this example we use the tag `"email"`.

> If the input is within one `FormInput`, it will be automatically validated when the form is validated.

> Consult the [table](list-validators.md) to see all `Validators` available, or [`create your own Validator`](create-validator.md)
