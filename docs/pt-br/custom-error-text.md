# Personalizar mensagem de erro

Você pode personalizar a mensagem de erro em cada `Input` usando o método `Validator.msg()`

```dart
Input(
  "email",
  validators: [
    Validators.email..msg("Insira um endereço de e-mail válido"),
  ],
),
```

> Seria interessante poder alterar a mensagem de um validator de forma global. [Contribuições](https://github.com/edsonbonfim/form/fork) são bem vindas.