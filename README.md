# Form

Uma forma simples e poderosa para manipulação de formulários em flutter. :rocket: :zap:

- **[ATENÇÃO: API Experimental](#aten%c3%87%c3%83o-api-experimental)**

- **[Criar um formulário com validação](#criar-um-formul%c3%a1rio-com-valida%c3%a7%c3%a3o)**

- **[Recuperar o valor de um campo de texto](#recuperar-o-valor-de-um-campo-de-texto)**

- **[Manipular alterações em um campo de texto](#manipular-altera%c3%a7%c3%b5es-em-um-campo-de-texto)**

- **[Validators](#validators)**

## ATENÇÃO: API Experimental

O `form` atualmente está em sua versão beta. As API disnibilizadas são totalmente funcionais, mas como foram recém lançadas, não tem testes e nem maturidade o suficiente para garantir sua estabilidade. Essas APIs podem sofrer muitas alterações até que uma versão estável seja lançada. Qualquer ajuda será muito bem vinda, seja através de issues ou de PRs.

## Criar um formulário com validação

Os aplicativos geralmente exigem que os usuários insiram informações em um campo de texto. Por exemplo, você pode exigir que os usuários efetuem login com uma combinação de endereço de email e senha.

Para tornar os aplicativos seguros e fáceis de usar, verifique se as informações que o usuário forneceu são válidas. Se o usuário tiver preenchido corretamente o formulário, processe as informações. Se o usuário enviar informações incorretas, exiba uma mensagem de erro amigável informando o que deu errado.

Neste exemplo, saiba como adicionar validação a um formulário que possui um único campo de texto usando as seguintes etapas:

1. Crie um `FormInput` com uma tag única para identifica-lo.
2. Adicione um `Input` com as validações necessárias
3. Crie um botão para validar e enviar o formulário

#### 1. Crie um `FormInput` com uma tag única para identifica-lo.

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

#### 2. Adicione um `Input` com as validações necessárias

Embora `FormInput` esteja no lugar, não há como os usuários digitarem texto nele. Esse é o trabalho de um `Input`. O `Input` renderiza um campo de texto no estilo material design e pode exibir erros de validação quando eles ocorrem.

Valide a entrada fornecendo uma lista de `Validator` para o `Input`.

```dart
Input(
  validators: [
    Validators.required,
  ],
);
```

> :bulb: **Dica**: Você pode personalizar a mensagem de erro usando o método `Validator.msg(errorText)`

```dart
Validators.required..msg("Please enter some text")
```

#### 3. Crie um botão para validar e enviar o formulário

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

> Veja esse [exemplo](./example/lib/validation.dart) para mais informações

## Recuperar o valor de um campo de texto

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

> Veja esse [exemplo](./example/lib/login.dart) para mais informações

## Manipular alterações em um campo de texto

Em alguns casos, é útil executar uma função de callback sempre que o texto em um campo de texto for alterado. Por exemplo, convém criar uma tela de pesquisa com funcionalidade de preenchimento automático, na qual deseja atualizar os resultados conforme o usuário digita.

Como você executa uma função de callback toda vez que o texto muda? Com o `form`, você tem duas opções:

1. Forneça um `onChanged()` retorno de chamada para o `Input`.
2. Usando `Input.get()`.

#### 1. Forneça um `onChanged()` retorno de chamada para o `Input`

A abordagem mais simples é fornecer um `onChanged()` retorno de chamada para o `Input`. Sempre que o texto muda, o retorno de chamada é invocado.

Neste exemplo, imprima o valor atual do campo de texto no console sempre que o texto for alterado.

```dart
Input(
  onChanged: (text) {
    print("First input: $text");
  },
);
```

#### 2. Usando `Input.get()`

Para ser notificado quando o texto for alterado, ouça o controlador usando o `addListener()` método, seguindo as seguintes etapas:

1. Crie uma `tag` para o `Input`.
2. Crie uma função para imprimir o valor mais recente.
3. Ouça o controlador para alterações.

**Crie uma `tag` para o `Input`**

```dart
Input(tag: "search");
```

**Crie uma função para imprimir o valor mais recente**

Você precisa de uma função para executar sempre que o texto for alterado. Crie um método que imprima o valor atual do campo de texto.

```dart
_printLatestValue(String text) {
  print("Second input: $text");
}
```

**Ouça o controlador para alterações**

Por fim, ouça as alterações chamando o método `_printLatestValue()`. Use o `addListener()` método para esse fim. Se desejar, pode parar de ouvir as alterações a qualquer momento usando o método `removeListener()`, porém, o `form` cuida de de descartar esse ouvinte automaticamente quando não for mais necessário, assim como anexa-lo novamente caso seja requisitado.

> :warning: **Atenção**: Garanta que o `Input` já tenha sido montado antes de chamar `addListener()`. Normalmente, se `addListener` for chamado dentro de um callback na ação de um botão, ou algo semelhante, o `Input` já estará montado, porém, se deseja chamar `addListener` em um `initState`, por exemplo, deverá coloca-lo dentro de ` WidgetsBinding.instance.addPersistentFrameCallback()`.

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPersistentFrameCallback((_) {
    Input.get("search").addListener(_printLatestValue);
  });
}
```

> Veja esse [exemplo](./example/lib/input_changes.dart) para mais informações

### Validators
| Validator | Description |
| :--- | :--- |
| Validators.alpha | Check if the string contains only letters (a-zA-Z) |
| Validators.alphanumeric | Check if the string str contains only letters and numbers |
| Validators.ascii | Check if the string contains ASCII chars only |
| Validators.base64 | Check if a string is base64 encoded |
| Validators.creditCard | Check if the string is a credit card |
| Validators.date | Check if the string is a date |
| Validators.email | Check if the string is an email |
| Validators.fullWidth | Check if the string contains any full-width chars |
| Validators.halfWidth | Check if the string contains any half-width chars |
| Validators.hexadecimal | Check if the string is a hexadecimal number |
| Validators.hexColor | Check if the string str is a hexadecimal color |
| Validators.isFloat | Check if the string is a float |
| Validators.isInt | Check if the string is an integer |
| Validators.json | Check if the string is valid JSON |
| Validators.lowercase | Check if the string is lowercase |
| Validators.mongoId | Check if the string is a valid hex-encoded representation of a MongoDB ObjectId |
| Validators.multibyte | Check if the string contains one or more multibyte chars |
| Validators.numeric | Check if the string contains only numbers |
| Validators.required | Check if the input has some value |
| Validators.surrogatePair | Check if the string contains any surrogate pairs chars |
| Validators.uppercase | Check if the string is uppercase |
| Validators.variableWidth | Check if the string contains a mixture of full and half-width chars |
| Validators.after(dynamic date) | Check if the string is a date that's after the specified date |
| Validators.byteLength(int min, [int max]) | Check if the string is a date that's before the specified date |
| Validators.contains(dynamic seed) | Check if the string contains the seed |
| Validators.divisibleBy(dynamic n) | Check if the string is a number that's divisible by another |
| Validators.equals(dynamic comparison) | Check if the string matches the comparison |
| Validators.fqnd({bool requireTld: true, bool allowUnderscores: false}) | Check if the string is a fully qualified domain name (e.g. domain.com) |
| Validators.inValues(List values) | Check if the string is in a array of allowed values |
| Validators.ip([dynamic version]) | Check if the string is IP version 4 or 6 |
| Validators.isBefore(dynamic date) | Check if the string is a date that's before the specified date |
| Validators.isbn([dynamic version]) | Check if the string is an ISBN (version 10 or 13) |
| Validators.length(int min, [int max]) | Check if the length of the string str falls in a range |
| Validators.matches(dynamic pattern) | Check if string matches the pattern |
| Validators.maxLength(int max) | Check if the length of the input value is more than or equal to max |
| Validators.minLength(int min) | Check if the length of the input value is less than or equal to min |
| Validators.uuid([dynamic version]) | Check if the string is a UUID (version 3, 4 or 5) |