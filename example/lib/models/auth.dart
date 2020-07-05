import 'package:form/form.dart';

class Auth extends FormModel {
  final username = input(validators: [
    // Validators.required,
    // Validators.email,
  ]);

  final password = input(validators: [
    Validators.required,
    Validators.minLength(6),
  ]);
}
