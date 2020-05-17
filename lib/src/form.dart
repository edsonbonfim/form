library form;

import 'package:flutter/material.dart';

import 'validator.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    Key key,
    @required this.tag,
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

  @override
  void initState() {
    super.initState();
    _forms[widget.tag] = key;
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
    this.validators,
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
    return _inputs[tag];
  }

  final key = GlobalKey<_InputBaseState>();

  @override
  void initState() {
    super.initState();
    final form = context.findRootAncestorStateOfType<_FormInputBaseState>();

    if (widget.tag != null) {
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

    return InputBase(
      key: key,
      tag: widget.tag,
      validators: widget.validators,
      autovalidate: widget.autovalidate,
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

class InputBase extends StatefulWidget {
  const InputBase({
    Key key,
    this.tag,
    this.autovalidate,
    this.validators,
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

  final bool autovalidate;

  final List<Validator> validators;

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
  _InputBaseState createState() => _InputBaseState();
}

class _InputBaseState extends State<InputBase> {
  TextEditingController _controller;

  String _errorText;

  TextEditingValue get value => _controller.value;

  String get text => _controller.text;

  String get errorText => _errorText;

  bool get isValid => _errorText == null;

  void Function(String) _listener;

  void addListener(void Function(String) listener) {
    assert(listener != null);
    _listener = listener;
    _controller.addListener(_attachListener);
  }

  void removeListener(void Function(String) listener) {
    _controller.removeListener(_attachListener);
    _listener = null;
  }

  void _attachListener() => _listener(text);

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    if (widget.autovalidate) {
      _autovalidate();
    }
  }

  @override
  void didUpdateWidget(InputBase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.autovalidate != widget.autovalidate) {
      if (widget.autovalidate) {
        _autovalidate();
      } else {
        _controller.removeListener(validate);
        setState(() => _errorText = null);
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(validate);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration.copyWith(
        errorText: _errorText,
      ),
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
      // enabled: widget.enabled ?? _decoration?.enabled ?? true,
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

  bool validate() {
    Validator validator;

    for (final v in widget.validators) {
      if (!v.validate(_controller?.text ?? "")) {
        validator = v;
        break;
      }
    }

    setState(() {
      _errorText = validator?.customErrorText ?? validator?.errorText ?? null;
    });

    return validator == null;
  }

  void _autovalidate() {
    validate();
    _controller.addListener(validate);
  }
}
