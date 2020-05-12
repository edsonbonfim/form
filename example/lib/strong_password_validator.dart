import 'package:form/form.dart';

class StrongPasswordValidator extends Validator {
  @override
  Future<bool> validate(String str) async {
    String regex = r"^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{6,}$";

    return RegExp(regex).hasMatch(str);
  }

  @override
  String get errorText => "Forneça uma senha mais forte";
}
