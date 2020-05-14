# Por quê form?

> Form foi pensado para ser extremamente fácil de usar.

## Introdução

Os aplicativos geralmente exigem que os usuários insiram informações em um campo de texto. Por exemplo, você pode exigir que os usuários efetuem login com uma combinação de endereço de email e senha.

Para tornar os aplicativos seguros e fáceis de usar, as informações que o usuário forneceu devem ser verificadas. Se o usuário tiver preenchido corretamente o formulário, processe as informações. Se o usuário enviar informações incorretas, exiba uma mensagem de erro amigável informando o que deu errado.

## Form e TextFormField

Podemos obter as caracteristicas acima usando widgets padrões do flutter como o `Form` e o `TextFormField`. O `Form` atua como um contêiner para agrupar e validar vários `TextFormField`.

## Então, por que usar o form?

Usar os widgets padrões do flutter em pequenos projetos podem ser uma boa opção, porém, gerenciar formulários em aplicações de médio e grande porte pode rapidamente tornar seu código grande e clicê.

Veja um pouco do que o form é capaz:

* Dezenas de validações prontas para uso e personalizáveis.

  ```dart
  // Cria um input que é obrigatório e deve conter um email válido 
  Input("email", validators: [Validators.required, Validators.email]);
  ```

* Crie seus próprios `Validator` de forma fácil e organizada.

* Acesse formulários e inputs em qualquer lugar do seu código, **sem depender** do `context`. Todas as informações que você precisa estão disponíveis; chega de usar `GlobalKey` para recuperar a mensagem de erro de um `TextFormField` ou validar um `Form`.

  ```dart
    FormInput.get("login"); // Retorna o formulário de login
    Input.get("email"); // Retorna o input email
  ```

* Pare agora mesmo de se preocupar com a memória que os formulários estão consumindo. O form gerencia todos os recursos de forma inteligente para você focar no que realmente importa.

* E muito mais... :rocket::zap:

# Não encontrei a funcionalidade que procurava :\

O form está crescendo a cada dia, caso você tenha sugestões de novas funcionalidades, ficaremos felizes em discutir sobre elas. Por favor, nos envie sua sugestão abrindo uma [issue](https://github.com/edsonbonfim/form/issues). :smile:
