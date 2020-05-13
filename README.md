# Form

Uma biblioteca para validar formulários de forma simples e completa.

# Versão Beta

O `form` atualmente está em sua versão beta. Isso significa que todas as APIs deste pacote estão em fase beta. Elas são totalmente funcionais, mas como foram recém lançadas, não tem testes e nem maturidade o suficiente para garantir sua estabilidade. Essas APIs podem sofrer muitas alterações até que uma versão estável seja lançada. Qualquer ajuda será muito bem vinda, seja através de issues ou de PRs.

# Validar um formulário

Um dos principais recursos de um aplicativo é permitir a entrada de informações pelo usuário, e na grande maioria, essas entradas são feitas por meio de formulários; aplicativos de médio e grande porte podem conter dezenas ou até centenas de formulários e, trabalhar com essa quantidade de formulários na forma proposta pelo flutter, pode ser bem inconveniente e trabalhoso.

Diante dessa dificuldade, surgiu a biblioteca `form`. A proposta é tornar simples a manipulação de formulários e, ao mesmo tempo, disponibilizar uma API poderosa e completa.

Quase todo aplicativo possui um sistema de login. Para realizar o login, normalmente temos um formulário com dois inputs e, por esses motivos, escolhemos esse formulário para usar-mos nos exemplos.

Dê uma olhada em como é feito um formulário de login, do jeito proposto pelo flutter, com o mínimo de validação.

```dart
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  final usernameKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();

  TextEditingController username;
  TextEditingController password;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            key: usernameKey,
            controller: username,
            validator: (value) {
              if (value.isEmpty) {
                return "This field is required";
              }
              if (value.length < 6) {
                return "Please lengthen this text to 6 characters or more";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Username",
            ),
          ),
          TextFormField(
            key: passwordKey,
            controller: password,
            validator: (value) {
              if (value.isEmpty) {
                return "This field is required";
              }

              String regex = r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$";

              if (!RegExp(regex).hasMatch(value)) {
                return "Your password must be have at least 8 characters long, 1 uppercase & 1 lowercase character and 1 number";
              }

              return null;
            },
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {
              if (formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Logged")),
                );
                print(username.text);
                print(password.text);
              } else {
                print(usernameKey.currentState.errorText);
                print(passwordKey.currentState.errorText);
              }
            },
          ),
        ],
      ),
    );
  }
}
```

Agora, vamos ver como fazemos isso usando o form.

```dart
class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormInput(
      tag: "login",
      child: Column(
        children: [
          Input(
            tag: "username",
            validators: [
              Validators.required,
              Validators.minLength(6),
            ],
            decoration: const InputDecoration(
              labelText: "Username",
            ),
          ),
          Input(
            tag: "password",
            validators: [
              Validators.required,
              Validators.strongPassword(),
            ],
            decoration: const InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            child: Text("login"),
            onPressed: () {
              if (FormInput.get("login").validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Logged")),
                );
                print(Input.get("username").text);
                print(Input.get("password").text);
              } else {
                print(Input.get("username").errorText);
                print(Input.get("password").errorText);
              }
            },
          ),
        ],
      ),
    );
  }
}
```

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
Input.get("username").text; 
```
