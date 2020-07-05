import 'package:form/form.dart';

class OnlyNumbers extends Validator {
  @override
  String get errorText => "Only numbers!";

  @override
  bool validate(String str) {
    return RegExp(r"^\d+$").hasMatch(str);
  }
}
