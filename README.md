# Form

Uma biblioteca para validar formulários de forma simples e completa.

# Versão Beta

O `form` atualmente está em sua versão beta. Isso significa que todas as APIs deste pacote estão em fase beta. Elas são totalmente funcionais, mas como foram recém lançadas, não tem testes e nem maturidade o suficiente para garantir sua estabilidade. Essas APIs podem sofrer muitas alterações até que uma versão estável seja lançada. Qualquer ajuda será muito bem vinda, seja através de issues ou de PRs.

## Criar um formulário com validação

Os aplicativos geralmente exigem que os usuários insiram informações em um campo de texto. Por exemplo, você pode exigir que os usuários efetuem login com uma combinação de endereço de email e senha.

Para tornar os aplicativos seguros e fáceis de usar, verifique se as informações que o usuário forneceu são válidas. Se o usuário tiver preenchido corretamente o formulário, processe as informações. Se o usuário enviar informações incorretas, exiba uma mensagem de erro amigável informando o que deu errado.

Neste exemplo, saiba como adicionar validação a um formulário que possui um único campo de texto usando as seguintes etapas:

1. Crie um `FormInput` com uma tag única para identifica-lo.
2. Adicione um `Input` com as validações necessárias
3. Crie um botão para validar e enviar o formulário

### 1. Crie um `FormInput` com uma tag única para identifica-lo.

Primeiro, crie um `FormInput`. O `FormInput` widget atua como um contêiner para agrupar e validar vários campos de formulário.

Ao criar o formulário, forneça uma tag. Isso identifica exclusivamente o `FormInput` e permite a validação do formulário em uma etapa posterior.

```dart
// Define a custom FormInput widget.
class MyCustomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build a FormInput widget.
    return FormInput(
      // This tag uniquely identifies the FormInput
      // widget and allows validation of the form.
      tag: "myCustomForm",
      child: Column(
        children: <Widget>[
          // Add Inputs and RaisedButton here.
        ],
      ),
    );
  }
}
```

### 2. Adicione um `Input` com as validações necessárias

Embora `FormInput` esteja no lugar, não há como os usuários digitarem texto nele. Esse é o trabalho de um `Input`. O `Input` renderiza um campo de texto no estilo material design e pode exibir erros de validação quando eles ocorrem.

Valide a entrada fornecendo uma lista de `Validator` para o `Input`.

```dart
Input(
  validators: [
    Validators.required,
  ],
);
```

---
**Dica:**

Você pode personalizar a mensagem de erro usando o método `Validator.msg`

```dart
Validators.required..msg("Please enter some text")
```
---

### 3. Crie um botão para validar e enviar o formulário

Agora que você possui um formulário com um campo de texto, forneça um botão no qual o usuário possa tocar para enviar as informações.

Quando o usuário tentar enviar o formulário, verifique se o formulário é válido. Se estiver, exiba uma mensagem de sucesso. Se não estiver (o campo de texto não possui conteúdo), exibir a mensagem de erro.

```dart
RaisedButton(
  onPressed: () {
    // validate returns true if the form is valid, otherwise false.
    if (FormInput.get("myCustomForm").validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  },
  child: Text('Submit'),
);
```

### Exemplo

Veja esse [exemplo completo](./example/lib/validation.dart), jutando todas as partes.

# Recuperar o valor de um campo de texto

Recuperar o texto que um usuário inseriu em um campo de texto usando o `form` é muito simples, basta adicionar uma `tag` ao widget `Input` e usar `Input.get(tag).text` para recuperar este valor.

Algumas informações sobre a propriedade `tag`:

* A `tag` pode ser qualquer valor e será usada para identificar o input.
* A `tag` informada deve ser única.
* Usar a mesma `tag` em mais de um `Input` resultará em um erro.

```dart
Input(
  tag: "username", // Defina uma tag ao input para identifica-lo
);
```

```dart
// Retorna o texto que o usuário inseriu no input
// Note que o parametro passado para o método `Input.get` deve ser
// o mesmo que o informado na tag do input.
Input.get("username").text; 
```
