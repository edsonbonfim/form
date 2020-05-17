# Why form?

> Form was thought to be extremely easy to use.

## Introduction

Applications generally require users to enter information in a text field. For example, you can require users to log in with a combination of email address and password.

To make applications safe and easy to use, the information the user has provided must be verified. If the user has completed the form correctly, process the information. If the user submits incorrect information, display a friendly error message stating what went wrong.

## Form and TextFormField

We can obtain the above features using standard flutter widgets like o `Form` and o `TextFormField`. The `Form` acts as a container to group and validate several `TextFormField`.

## So, why use the form?

Using standard flutter widgets for small projects can be a good option, however, managing forms in medium and large applications can quickly make your code big and clickable.

See a little of what the form is capable of:

* Dozens of validations ready to use and customizable.

  ```dart
  // Cria um input que é obrigatório e deve conter um email válido 
  Input("email", validators: [Validators.required, Validators.email]);
  ```

* Create your own `Validator` in an easy and organized way.

* Access forms and inputs anywhere in your code, **without depending** on `context`. All the information you need is available; enough to use `GlobalKey` to retrieve an error message `TextFormField` or validate a `Form`.

  ```dart
    FormInput.get("login"); // Retorna o formulário de login
    Input.get("email"); // Retorna o input email
  ```

* Stop worrying about the memory forms are consuming right now. The form manages all resources intelligently so you can focus on what really matters.

* And much more... :rocket::zap:

# I didn't find the functionality I was looking for :\

The form is growing every day, if you have suggestions for new features, we would be happy to discuss them. Please send us your suggestion by opening an [issue](https://github.com/edsonbonfim/form/issues). :smile:
