library form;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'validator.dart';

class FormInput extends StatefulWidget {
  const FormInput(
    this.tag, {
    Key key,
    @required this.child,
  }) : super(key: key);

  static _FormInputBaseState get(dynamic tag) =>
      _FormInputState.get(tag).currentState;

  final dynamic tag;

  final Widget child;

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  static final _forms = <dynamic, GlobalKey<_FormInputBaseState>>{};

  static GlobalKey<_FormInputBaseState> get(dynamic tag) {
    return _forms[tag];
  }

  final key = GlobalKey<_FormInputBaseState>();

  FormModel get model => widget.tag is FormModel ? widget.tag : null;

  @override
  void initState() {
    super.initState();

    if (model != null) {
      _forms[model.hashCode] = key;
    } else {
      _forms[widget.tag] = key;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormInputBase(
      key: key,
      child: widget.child,
    );
  }
}

class FormInputBase extends StatefulWidget {
  const FormInputBase({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _FormInputBaseState createState() => _FormInputBaseState();
}

class _FormInputBaseState extends State<FormInputBase> {
  final _inputs = <dynamic, GlobalKey<_InputBaseState>>{};

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  _InputBaseState input(dynamic tag) {
    return _inputs[tag].currentState;
  }

  bool validate() {
    bool hasError = false;
    for (final input in _inputs.values) {
      if (!input.currentState.validate()) {
        hasError = true;
      }
    }
    return !hasError;
  }
}

class Input extends StatefulWidget {
  const Input(
    this.tag, {
    Key key,
    this.autovalidate = false,
    this.validators = const <Validator>[],
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.onTap,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
  }) : super(key: key);

  static _InputBaseState get(dynamic tag) => _InputState.get(tag).currentState;

  final dynamic tag;

  final bool autovalidate;

  final List<Validator> validators;

  final TextEditingController controller;

  final String initialValue;

  final FocusNode focusNode;

  final InputDecoration decoration;

  final TextInputType keyboardType;

  final TextInputAction textInputAction;

  final TextCapitalization textCapitalization;

  final TextStyle style;

  final StrutStyle strutStyle;

  final TextAlign textAlign;

  final TextAlignVertical textAlignVertical;

  final TextDirection textDirection;

  final bool autofocus;

  final bool obscureText;

  final bool autocorrect;

  final SmartDashesType smartDashesType;

  final SmartQuotesType smartQuotesType;

  final bool enableSuggestions;

  final int maxLines;

  final int minLines;

  final bool expands;

  final bool readOnly;

  final ToolbarOptions toolbarOptions;

  final bool showCursor;

  static const int noMaxLength = -1;

  final int maxLength;

  final bool maxLengthEnforced;

  final ValueChanged<String> onChanged;

  final VoidCallback onEditingComplete;

  final ValueChanged<String> onSubmitted;

  final bool enabled;

  final double cursorWidth;

  final Radius cursorRadius;

  final Color cursorColor;

  final Brightness keyboardAppearance;

  final EdgeInsets scrollPadding;

  final bool enableInteractiveSelection;

  bool get selectionEnabled => enableInteractiveSelection;

  final GestureTapCallback onTap;

  final InputCounterWidgetBuilder buildCounter;

  final ScrollPhysics scrollPhysics;

  final ScrollController scrollController;

  final Iterable<String> autofillHints;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  static final _inputs = <dynamic, GlobalKey<_InputBaseState>>{};

  static GlobalKey<_InputBaseState> get(dynamic tag) {
    if (_inputs.containsKey(tag.hashCode)) {
      return _inputs[tag.hashCode];
    }

    if (!_inputs.containsKey(tag)) {
      throw Exception('The input "$tag" not build yet.');
    }

    return _inputs[tag];
  }

  final key = GlobalKey<_InputBaseState>();

  InputNotifier get model => widget.tag is InputNotifier ? widget.tag : null;

  @override
  void initState() {
    super.initState();
    final form = context.findRootAncestorStateOfType<_FormInputBaseState>();

    if (model != null) {
      _inputs[model.hashCode] = key;
    } else {
      _inputs[widget.tag] = key;
    }

    if (form != null) {
      form?._inputs[widget.tag ?? key.hashCode] = key;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasDirectionality(context));

    assert(
      !(widget.style != null &&
          widget.style.inherit == false &&
          (widget.style.fontSize == null || widget.style.textBaseline == null)),
      'inherit false style must supply fontSize and textBaseline',
    );

    return _InputBase(
      widget.tag,
      key: key,
      model: model,
      validators: widget.validators,
      autovalidate: widget.autovalidate,
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      textCapitalization: widget.textCapitalization,
      autofocus: widget.autofocus,
      toolbarOptions: widget.toolbarOptions,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType ??
          (widget.obscureText
              ? SmartDashesType.disabled
              : SmartDashesType.enabled),
      smartQuotesType: widget.smartQuotesType ??
          (widget.obscureText
              ? SmartQuotesType.disabled
              : SmartQuotesType.enabled),
      enableSuggestions: widget.enableSuggestions,
      maxLengthEnforced: widget.maxLengthEnforced,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      scrollPadding: widget.scrollPadding,
      scrollPhysics: widget.scrollPhysics,
      keyboardAppearance: widget.keyboardAppearance,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      buildCounter: widget.buildCounter,
    );
  }
}

class _InputBase extends StatefulWidget {
  const _InputBase(
    this.tag, {
    Key key,
    this.model,
    this.autovalidate,
    this.validators,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.onTap,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
  }) : super(key: key);

  final dynamic tag;

  final InputNotifier model;

  final bool autovalidate;

  final List<Validator> validators;

  final TextEditingController controller;

  final String initialValue;

  final FocusNode focusNode;

  final InputDecoration decoration;

  final TextInputType keyboardType;

  final TextInputAction textInputAction;

  final TextCapitalization textCapitalization;

  final TextStyle style;

  final StrutStyle strutStyle;

  final TextAlign textAlign;

  final TextAlignVertical textAlignVertical;

  final TextDirection textDirection;

  final bool autofocus;

  final bool obscureText;

  final bool autocorrect;

  final SmartDashesType smartDashesType;

  final SmartQuotesType smartQuotesType;

  final bool enableSuggestions;

  final int maxLines;

  final int minLines;

  final bool expands;

  final bool readOnly;

  final ToolbarOptions toolbarOptions;

  final bool showCursor;

  final int maxLength;

  final bool maxLengthEnforced;

  final ValueChanged<String> onChanged;

  final VoidCallback onEditingComplete;

  final ValueChanged<String> onSubmitted;

  final bool enabled;

  final double cursorWidth;

  final Radius cursorRadius;

  final Color cursorColor;

  final Brightness keyboardAppearance;

  final EdgeInsets scrollPadding;

  final bool enableInteractiveSelection;

  bool get selectionEnabled => enableInteractiveSelection;

  final GestureTapCallback onTap;

  final InputCounterWidgetBuilder buildCounter;

  final ScrollPhysics scrollPhysics;

  final ScrollController scrollController;

  final Iterable<String> autofillHints;

  @override
  _InputBaseState createState() => _InputBaseState();
}

class _InputBaseState extends State<_InputBase> {
  TextEditingController _controller;

  TextEditingController get controller => _controller;

  TextEditingValue get value => _controller.value;

  String _errorText;

  String get text => _controller.text;

  String get errorText => _errorText;

  final textNotifier = ValueNotifier<String>("");

  @Deprecated('Use validate method instaed.')
  bool get isValid => _errorText == null;

  @override
  void initState() {
    super.initState();
    _setController();
  }

  @override
  void didUpdateWidget(_InputBase oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      removeListener(_changeValue);
      removeListener(validate);
      _setController();
    } else if (oldWidget.initialValue != widget.initialValue) {
      _setInitialValue();
    }

    // Revalidar input se os validators forem alterados e já exitir alguma mensagem
    // de erro
    // TODO: verificar a atualização quando alterar os validators dos models
    if (_errorText != null &&
        (!listEquals(oldWidget.validators, widget.validators) ||
            !listEquals(oldWidget.model.validators, widget.model.validators))) {
      validate();
    }

    // autovalidate
    if (oldWidget.autovalidate != widget.autovalidate) {
      if (widget.autovalidate) {
        if (_errorText != null || text.isNotEmpty) {
          validate();
        }
        addListener(validate);
      } else {
        removeListener(validate);
        setState(() => _errorText = null);
      }
    }
  }

  @override
  void dispose() {
    // Remove o listener de autovalidate
    removeListener(validate);

    removeListener(_changeValue);

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration.copyWith(errorText: _errorText),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      textCapitalization: widget.textCapitalization,
      autofocus: widget.autofocus,
      toolbarOptions: widget.toolbarOptions,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType ??
          (widget.obscureText
              ? SmartDashesType.disabled
              : SmartDashesType.enabled),
      smartQuotesType: widget.smartQuotesType ??
          (widget.obscureText
              ? SmartQuotesType.disabled
              : SmartQuotesType.enabled),
      enableSuggestions: widget.enableSuggestions,
      maxLengthEnforced: widget.maxLengthEnforced,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled ?? widget.decoration.enabled,
      cursorWidth: widget.cursorWidth,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      scrollPadding: widget.scrollPadding,
      scrollPhysics: widget.scrollPhysics,
      keyboardAppearance: widget.keyboardAppearance,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      buildCounter: widget.buildCounter,
    );
  }

  /// Retorna [true] caso o input esteja válido, caso contrário retorna [false]
  bool validate() {
    final widgetValidators = widget.validators ?? [];
    final modelValidators = widget.model?.validators ?? [];

    // Concatena os validators do widget com os validators do model
    final validators = [...widgetValidators, ...modelValidators];

    for (final v in validators) {
      if (!v.validate(text ?? "")) {
        // Atualiza a mensagem de erro do input
        setState(() {
          // Se houver, usar a mensagem customizada, senão usar a mensagem padrão
          _errorText = v.customErrorText ?? v.errorText;
        });

        // Input inválido
        return false;
      }
    }

    setState(() => _errorText = null);

    // Input válido
    return true;
  }

  void _setController() {
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_changeValue);
    if (text != null && text.isNotEmpty) {
      _controller.value = TextEditingValue(text: text);
    } else {
      _setInitialValue();
    }
    if (widget.autovalidate) addListener(validate);
  }

  void _setInitialValue() {
    if (widget.initialValue != null) {
      _controller.value = TextEditingValue(text: widget.initialValue);
    } else {
      _controller.value = TextEditingValue.empty;
    }
  }

  /// Permitir que atualizações no input sejam detectadas com o [ValueNotifier]
  void _changeValue() {
    textNotifier.value = text;
    widget.model?.value = text;
  }

  /// Equivalente a [TextEditingController.addListener]
  void addListener(VoidCallback listener) {
    assert(listener != null);
    _controller.addListener(listener);
  }

  /// Equivalente a [TextEditingController.removeListener]
  void removeListener(VoidCallback listener) {
    _controller.removeListener(listener);
  }
}

class InputText extends StatelessWidget {
  final dynamic tag;
  final String defaultValue;

  const InputText(
    this.tag, {
    Key key,
    this.defaultValue = "",
  })  : assert(tag != null),
        super(key: key);

  _InputBaseState get input => Input.get(tag);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: input.textNotifier,
      builder: (context, value, child) => Text(
        value.isEmpty ? defaultValue : value,
      ),
    );
  }
}

class FormModel {
  _FormInputBaseState get state => FormInput.get(hashCode);

  bool validate() => state.validate();
}

class InputNotifier<T> extends ValueNotifier<T> {
  InputNotifier(value, this.validators) : super(value);

  final List<Validator> validators;

  _InputBaseState get state => Input.get(hashCode);

  bool validate() => state.validate();

  bool get isValid => state.isValid;

  String get errorText => state.errorText;

  @override
  String toString() => value.toString();
}

extension StringNotifier on String {
  InputNotifier<String> get input {
    return InputNotifier<String>(this, null);
  }
}

InputNotifier<String> input({
  dynamic initialData = "",
  List<Validator> validators,
}) {
  return InputNotifier<String>(initialData, validators);
}
