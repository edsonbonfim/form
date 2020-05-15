# Escutar alterações em um Input

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
Input("search");
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

!> Garanta que o `Input` já tenha sido montado antes de chamar `addListener()`. Normalmente, se `addListener` for chamado dentro de um callback na ação de um botão, ou algo semelhante, o `Input` já estará montado, porém, se deseja chamar `addListener` em um `initState`, por exemplo, deverá coloca-lo dentro de ` WidgetsBinding.instance.addPersistentFrameCallback()`.

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPersistentFrameCallback((_) {
    Input.get("search").addListener(_printLatestValue);
  });
}
```