import 'package:flutter/material.dart';

import 'validator.dart';

class InputController {
  InputController({
    this.validators,
    this.autovalidate = false,
    this.initialValue = "",
  }) : assert(autovalidate != null) {
    reset();
  }

  final String initialValue;

  final List<Validator> validators;

  final bool autovalidate;

  final textEditingController = TextEditingController();

  final _text = ValueNotifier<String>("");

  final _errorText = ValueNotifier<String>(null);

  final _isValid = ValueNotifier<bool>(true);

  ValueNotifier<String> get textNotifier => _text;

  ValueNotifier<String> get errorTextNotifier => _errorText;

  String get text => _text.value;

  ValueNotifier<bool> get isValidNotifier => _isValid;

  bool get isValid => _isValid.value;

  bool get hasError => errorText != null;

  String get errorText => _errorText.value;

  Future<bool> validate() async {
    for (final validator in validators) {
      // loading
      _isValid.value = null;

      var hasError = !await validator.validate(text);

      // unloading
      _isValid.value = !hasError;

      if (hasError) {
        _errorText.value = validator.customErrorText ?? validator.errorText;
        return false;
      }
    }

    _isValid.value = true;
    _errorText.value = null;

    return true;
  }

  void reset() {
    textEditingController.removeListener(_listen);

    textEditingController.text = initialValue;
    _text.value = initialValue;
    _isValid.value = true;
    _errorText.value = null;

    if (autovalidate) {
      textEditingController.addListener(_listen);
    }
  }

  void _listen() {
    _text.value = textEditingController.text;
    validate();
  }

  void dispose() {
    textEditingController.dispose();
  }
}
