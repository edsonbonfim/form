# Criar um formulário com validação

Neste exemplo, saiba como adicionar validação a um formulário de login que possui dois campos de texto usando as seguintes etapas:

1. Crie um `FormInput` com uma tag única para identifica-lo.
2. Adicione os `Input` com as validações necessárias.
3. Crie um botão para validar e enviar o formulário.

#### 1. Crie um `FormInput` com uma tag única para identifica-lo.

Primeiro, crie um `FormInput`. O `FormInput` widget atua como um contêiner para agrupar e validar vários `Input`.

Ao criar o formulário, forneça uma tag. Isso identifica exclusivamente o `FormInput` e permite a validação do formulário em uma etapa posterior.

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

#### 2. Adicione os `Input` com as validações necessárias.

O `Input` renderiza um campo de texto no estilo material design e pode exibir erros de validação quando eles ocorrem.

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

#### 3. Crie um botão para validar e enviar o formulário

Agora que você possui um formulário com os campos de texto, forneça um botão no qual o usuário possa tocar para enviar as informações.

Quando o usuário tentar enviar o formulário, verifique se o formulário é válido. Se estiver, exiba uma mensagem de sucesso. Se não estiver, exibir a mensagem de erro.

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

!> Note que a `tag` usada para construir o `InputForm` deve ser a mesma usada no método `InputForm.get()`. Neste exemplo usamos a tag `"login"`.

> Consulte a [tabela](list-validators.md) para ver todos os `Validators` disponíveis, ou [crie seu próprio `Validator`](create-validator.md)