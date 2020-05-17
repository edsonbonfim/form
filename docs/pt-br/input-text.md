# Recuperar o valor de um Input

Recuperar o texto que um usuário inseriu em um campo de texto usando o `form` é muito simples, basta adicionar uma `tag` ao widget `Input` e usar `Input.get(tag).text` para recuperar este valor.

Algumas informações sobre a propriedade `tag`:

* A `tag` pode ser qualquer valor e será usada para identificar o input.
* A `tag` informada deve ser única.
* Usar a mesma `tag` em mais de um `Input` resultará em um erro.

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
