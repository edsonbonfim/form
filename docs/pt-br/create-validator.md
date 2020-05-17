# Criar seu próprio Validator

Form disponibiliza dezenas de `Validators` prontos para uso, entretando, em alguns casos é necessário criar uma regra personalizada de validação.

> Fique atento a [lista](list-validators.md) de `Validators` para ver todas as opções disponíveis. 

Neste exemplo, saiba como criar e usar um `Validator` que verifica se o `Input` possui a palavra `"form"` usando as seguintes etapas:

1. Criar uma classe que extende `Validator`.
2. Implementar o método `validate()`.
3. Definir uma mensagem de erro.
4. Usar o `Validator` em um `Input`

> Essa funcionalidade está disponivel no form usando `Validators.contains(["form"])`, mas usaremos esse exemplo devido a dificuldade de encontrar uma lógica de validação que ainda não está disponível no form.

#### 1. Criar uma classe que extende Validator.

```dart
class MyCustomValidator extends Validator {}
```

#### 2. Implementar o método validate().

```dart
class MyCustomValidator extends Validator {
  @override
  bool validate(String str) => str.contains("form");
}
```

#### 3. Definir uma mensagem de erro.

```dart
class MyCustomValidator extends Validator {
  @override
  bool validate(String str) => str.contains("form");

  @override
  String get errorText => 'Este campo de texto deve conter a palavra "form"';
}
```

#### 4. Usar o Validator em um Input

```dart
Input(
  "input",
  validators: [
    MyCustomValidator(),
  ],
);
```