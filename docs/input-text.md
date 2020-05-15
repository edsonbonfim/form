# Retrieve the value of an Input

Retrieving the text that a user entered into a text field using form is very simple, just add one `tag` to the widget `Input` and use it `Input.get(tag).text` to retrieve this value.

Some information about the property `tag`:

* `tag` can be any value and will be used to identify the input.
* `tag` informed must be unique.
* Using it `tag` in more than one will `Input` result in an error.

```dart
Input(
  "name", // Define uma tag ao input para identifica-lo
);
```

```dart
// Retorna o texto que o usuário inseriu no input
// Note que o parametro passado para o método `Input.get` deve ser
// o mesmo que o informado na tag do input.
Input.get("name").text; 
```
