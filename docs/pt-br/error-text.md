# Recuperar mensagem de erro

Em alguns casos, é necessário obter qual a mensagem de erro após a validação de um formulário ou input. Neste exemplo, saiba como recuperar e exibir no console a mensagem de erro.

> Quando um formulário ou input é validado, form cuida de mostrar a mensagem de erro automáticamente.

Primeiro, vamos criar um campo de texto para um endereço de e-mail.  

```dart
Input(
  "email",
  validators: [Validators.email],
);
```

Agora vamos validar o input. Se o e-mail informado pelo usuário não for válido, exibimos a mensagem de erro no console.

```dart
if (!Input.get("email").validate()) {
  print(Input.get("email").errorText);
}
```
