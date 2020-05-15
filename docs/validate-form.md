# Create a form with validation

In this example, learn how to add validation to a login form that has two text fields using the following steps:

1. Create a `FormInput` with a unique tag to identify it.
2. Add the ones `Input` with the necessary validations.
3. Create a button to validate and submit the form.

#### 1. Create a FormInput with a unique tag to identify it.

First, create a `FormInput`. The `FormInput` widget acts as a container to group and validate several Input.

When creating the form, provide a tag. This uniquely identifies `FormInput` and allows validation of the form at a later stage.

```dart
FormInput(
  "login", // Identifica exclusivamente o formulário e permite sua validação.
  child: Column(
    children: <Widget>[
      // Inputs e RaisedButton aqui.
    ],
  ),
);
```

#### 2. Add the ones Input with the necessary validations.

The `Input` renders a text field in the material style design and can display validation errors when they occur.

```dart
Column(
  children: <Widget>[
    Input(
      "username",
      validators: [Validators.email],
    ),
    Input(
      "password",
      obscureText: true,
      validators: [Validators.strongPassword()],
    ),
    // RaisedButton aqui. 
  ],
);
```

#### 3. Create a button to validate and submit the form

Now that you have a form with the text fields, provide a button that the user can tap to send the information.

When the user tries to submit the form, check that the form is valid. If so, display a success message. If not, display the error message.

```dart
RaisedButton(
  onPressed: () {
    // validate() retorna true se o formulário for válido, se não retorna false.
    if (FormInput.get("login").validate()) {
      // Se o formulário for válido, mostra uma snackbar. Em um projeto real,
      // você costuma chamar um servidor ou salvar as informações em um banco de dados.
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Processando...")));
    }
  },
  child: Text("Entrar"),
);
```

!> Note that the the `tag` used to build the `InputForm` must be the same used in the method `InputForm.get()`. In this example we use the tag `"login"`.

> Consult the [table](list-validators.md) to see all `Validators` available, or [`create your own Validator`](create-validator.md)
