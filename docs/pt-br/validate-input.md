# Criar um input com validação

Neste exemplo, saiba como adicionar validação a um input de email.

```dart
Input(
  "email",
  validators: [Validators.email],
),
```

Agora basta validar se o texto informado pelo usuário é um endereço de email válido.

```dart
// Retorna [true] se for um email válido, caso contrário, retorna [false]
Input.get("email").validate();
```

!> Note que a `tag` usada para construir o `Input` deve ser a mesma usada no método `Input.get()`. Neste exemplo usamos a tag `"email"`.

> Se o input estiver dentro de um `FormInput`, ele será automáticamente validado quando o formulário for validado.

> Consulte a [tabela](list-validators.md) para ver todos os `Validators` disponíveis, ou [crie seu próprio `Validator`](create-validator.md)

