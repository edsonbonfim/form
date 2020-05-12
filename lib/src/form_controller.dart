import 'input_controller.dart';

class FormController {
  final _inputs = <InputController>[];

  void add(InputController controller) => _inputs.add(controller);

  void remove(InputController controller) => _inputs.remove(controller);

  void reset() {
    _inputs.forEach((input) => input.reset());
  }

  Future<bool> validate() async {
    bool hasError = true;

    for (final input in _inputs) {
      if (!await input.validate()) {
        hasError = false;
      }
    }

    return hasError;
  }

  Future<bool> validateUntilFailed() async {
    for (final input in _inputs) {
      if (!await input.validate()) return false;
    }
    return true;
  }

  void dispose() {}
}
