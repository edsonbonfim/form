import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;

abstract class Validators {
  /// Check if the string contains the seed
  static Validator contains(dynamic seed) => ContainsValidator(seed);

  /// Check if the string matches the comparison
  static Validator equals(dynamic comparison) => EqualsValidator(comparison);

  /// Check if the string is a date that's after the specified date
  static Validator after(dynamic date) => AfterValidator(date);

  /// Check if the string contains only letters (a-zA-Z)
  static Validator get alpha => AlphaValidator();

  /// Check if the string str contains only letters and numbers
  static Validator get alphanumeric => AlphanumericValidator();

  /// Check if the string contains ASCII chars only
  static Validator get ascii => AsciiValidator();

  /// Check if a string is base64 encoded
  static Validator get base64 => Base64Validator();

  /// Check if the string is a date that's before the specified date
  static Validator isBefore(dynamic date) => BeforeValidator(date);

  /// Check if the string is a date that's before the specified date
  static Validator byteLength(int min, [int max]) =>
      ByteLengthValidator(min, max);

  /// Check if the string is a credit card
  static Validator get creditCard => CreditCardValidator();

  /// Check if the string is a date
  static Validator get date => DateValidator();

  /// Check if the string is a number that's divisible by another
  static Validator divisibleBy(dynamic n) => DivisibleByValidator(n);

  /// Check if the string is an email
  static Validator get email => EmailValidator();

  /// Check if the string is a float
  static Validator get isFloat => FloatValidator();

  /// Check if the string is a fully qualified domain name (e.g. domain.com)
  static Validator fqnd({
    bool requireTld = true,
    bool allowUnderscores = false,
  }) =>
      FQNDValidator(
        requireTld: requireTld,
        allowUnderscores: allowUnderscores,
      );

  /// Check if the string contains any full-width chars
  static Validator get fullWidth => FullWidthValidator();

  /// Check if the string contains any half-width chars
  static Validator get halfWidth => HalfWidthValidator();

  /// Check if the string is a hexadecimal number
  static Validator get hexadecimal => HexadecimalValidator();

  /// Check if the string str is a hexadecimal color
  static Validator get hexColor => HexColorValidator();

  /// Check if the string is in a array of allowed values
  static Validator inValues(List<dynamic> values) => InValidator(values);

  /// Check if the string is an integer
  static Validator get isInt => IntValidator();

  /// Check if the string is IP version 4 or 6
  static Validator ip([/* <String | int> */ dynamic version]) =>
      IPValidator(version);

  /// Check if the string is an ISBN (version 10 or 13)
  static Validator isbn([/* <String | int> */ dynamic version]) =>
      ISBNValidator(version);

  /// Check if the string is valid JSON
  static Validator get json => JsonValidator();

  /// Check if the length of the string str falls in a range
  static Validator length(int min, [int max]) => LengthValidator(min, max);

  /// Check if the input has some value
  static Validator get required => length(1);

  /// Check if the length of the input value is less than or equal to [min]
  static Validator minLength(int min) => length(min);

  /// Check if the length of the input value is more than or equal to [max]
  static Validator maxLength(int max) => length(0, max);

  /// Check if the string is lowercase
  static Validator get lowercase => LowercaseValidator();

  /// Check if the string is a valid hex-encoded representation of a MongoDB ObjectId
  static Validator get mongoId => MongoIdValidator();

  /// Check if the string contains one or more multibyte chars
  static Validator get multibyte => MultibyteValidator();

  /// Check if the string contains only numbers
  static Validator get numeric => NumericValidator();

  /// Check if the string contains any surrogate pairs chars
  static Validator get surrogatePair => SurrogatePairValidator();

  /// Check if the string is uppercase
  static Validator get uppercase => UppercaseValidator();

  /// Check if the string is a URL
  static Validator url({
    List<String> protocols = const ['http', 'https', 'ftp'],
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const [],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
  }) =>
      URLValidator(
        allowUnderscore: allowUnderscore,
        hostBlacklist: hostBlacklist,
        hostWhitelist: hostWhitelist,
        protocols: protocols,
        requireProtocol: requireProtocol,
        requireTld: requireTld,
      );

  /// Check if the string is a UUID (version 3, 4 or 5)
  static Validator uuid([/* <String | int> */ dynamic version]) =>
      UUIDValidator(version);

  /// Check if the string contains a mixture of full and half-width chars
  static Validator get variableWidth => VariableWidthValidator();

  /// Check if string matches the pattern
  static Validator matches(dynamic pattern) => MatchesValidator(pattern);
}

extension ValidatorExt on TextEditingController {
  static final _keys = <int, GlobalKey<FormFieldState>>{};
  static final _validations = <int, Map<Validator, String>>{};

  @protected
  void setKey(GlobalKey<FormFieldState<dynamic>> key) {
    _keys[hashCode] = key;
  }

  void validators(Map<Validator, String> validations) {
    _validations[hashCode] = validations;
  }

  BuildContext get context => _keys[hashCode].currentContext;

  FormFieldState get state => _keys[hashCode].currentState;

  bool get hasError => state.hasError;

  bool get isValid => state.isValid;

  void reset() => state.reset();

  String get errorText => state.errorText;

  /// Validates an input.
  /// Returns an error string to display if the input is invalid, or null otherwise.
  ///
  /// The returned value is exposed by the [FormFieldState.errorText] property.
  /// The [TextFormField] uses this to override the [InputDecoration.errorText] value.
  ///
  /// Alternating between error and normal state can cause the height of the
  /// [TextFormField] to change if no other subtext decoration is set on the field.
  /// To create a field whose height is fixed regardless of whether or not an error
  /// is displayed, either wrap the [TextFormField] in a fixed height parent like
  /// [SizedBox], or set the [TextFormField.helperText] parameter to a space.
  String validator([String str]) {
    String error;

    for (var validation in _validations[this.hashCode].keys) {
      if (!validation.validate(str ?? this.text)) {
        error = _validations[this.hashCode][validation];
        break;
      }
    }

    return error;
  }
}

extension FormExt on GlobalKey<FormState> {
  bool validate() => currentState.validate();
}

abstract class Validator {
  bool validate(String str);
}

/// Check if the string contains the seed
class ContainsValidator extends Validator {
  ContainsValidator(this.seed);

  final dynamic seed;

  @override
  bool validate(String str) => validator.contains(str, seed);
}

/// Check if the string matches the comparison
class EqualsValidator extends Validator {
  EqualsValidator(this.comparison);

  final dynamic comparison;

  @override
  bool validate(String str) => validator.equals(str, comparison);
}

/// Check if the string is a date that's after the specified date
class AfterValidator extends Validator {
  AfterValidator([this.date]);

  final dynamic date;

  @override
  bool validate(String str) => validator.isAfter(str, date);
}

/// Check if the string contains only letters (a-zA-Z)
class AlphaValidator extends Validator {
  @override
  bool validate(String str) => validator.isAlpha(str);
}

/// Check if the string str contains only letters and numbers
class AlphanumericValidator extends Validator {
  @override
  bool validate(String str) => validator.isAlphanumeric(str);
}

/// Check if the string contains ASCII chars only
class AsciiValidator extends Validator {
  @override
  bool validate(String str) => validator.isAscii(str);
}

/// Check if a string str is base64 encoded
class Base64Validator extends Validator {
  @override
  bool validate(String str) => validator.isBase64(str);
}

/// Check if the string is a date that's before the specified date
class BeforeValidator extends Validator {
  BeforeValidator([this.date]);

  final dynamic date;

  @override
  bool validate(String str) => validator.isBefore(str, date);
}

/// Check if the string is a date that's before the specified date
class ByteLengthValidator extends Validator {
  ByteLengthValidator(this.min, [this.max]);

  final int min, max;

  @override
  bool validate(String str) => validator.isByteLength(str, min, max);
}

/// Check if the string is a credit card
class CreditCardValidator extends Validator {
  @override
  bool validate(String str) => validator.isCreditCard(str);
}

/// Check if the string is a date
class DateValidator extends Validator {
  @override
  bool validate(String str) => validator.isDate(str);
}

/// Check if the string is a number that's divisible by another
class DivisibleByValidator extends Validator {
  DivisibleByValidator(this.n);

  final dynamic n;

  @override
  bool validate(String str) => validator.isDivisibleBy(str, n);
}

/// Check if the string is an email
class EmailValidator extends Validator {
  @override
  bool validate(String str) => validator.isEmail(str);
}

/// Check if the string is a float
class FloatValidator extends Validator {
  @override
  bool validate(String str) => validator.isFloat(str);
}

/// Check if the string is a fully qualified domain name (e.g. domain.com)
class FQNDValidator extends Validator {
  FQNDValidator({
    this.requireTld = true,
    this.allowUnderscores = false,
  });

  final bool requireTld, allowUnderscores;

  @override
  bool validate(String str) => validator.isFQDN(
        str,
        requireTld: requireTld,
        allowUnderscores: allowUnderscores,
      );
}

/// Check if the string contains any full-width chars
class FullWidthValidator extends Validator {
  @override
  bool validate(String str) => validator.isFullWidth(str);
}

/// Check if the string contains any half-width chars
class HalfWidthValidator extends Validator {
  @override
  bool validate(String str) => validator.isHalfWidth(str);
}

/// Check if the string is a hexadecimal number
class HexadecimalValidator extends Validator {
  @override
  bool validate(String str) => validator.isHexadecimal(str);
}

/// Check if the string str is a hexadecimal color
class HexColorValidator extends Validator {
  @override
  bool validate(String str) => validator.isHexColor(str);
}

/// Check if the string is in a array of allowed values
class InValidator extends Validator {
  InValidator(this.values);

  final List<dynamic> values;

  @override
  bool validate(String str) => validator.isIn(str, values);
}

/// Check if the string is an integer
class IntValidator extends Validator {
  @override
  bool validate(String str) => validator.isInt(str);
}

/// Check if the string is IP version 4 or 6
class IPValidator extends Validator {
  IPValidator([/* <String | int> */ this.version]);

  final dynamic version;

  @override
  bool validate(String str) => validator.isIP(str, version);
}

/// Check if the string is an ISBN (version 10 or 13)
class ISBNValidator extends Validator {
  ISBNValidator([/* <String | int> */ this.version]);

  final dynamic version;

  @override
  bool validate(String str) => validator.isISBN(str, version);
}

/// Check if the string is valid JSON
class JsonValidator extends Validator {
  @override
  bool validate(String str) => validator.isJSON(str);
}

/// Check if the length of the string str falls in a range
class LengthValidator extends Validator {
  LengthValidator(this.min, [this.max]);

  final int min, max;

  @override
  bool validate(String str) => validator.isLength(str, min, max);
}

/// Check if the string is lowercase
class LowercaseValidator extends Validator {
  @override
  bool validate(String str) => validator.isLowercase(str);
}

/// Check if the string is a valid hex-encoded representation of a MongoDB ObjectId
class MongoIdValidator extends Validator {
  @override
  bool validate(String str) => validator.isMongoId(str);
}

/// Check if the string contains one or more multibyte chars
class MultibyteValidator extends Validator {
  @override
  bool validate(String str) => validator.isMultibyte(str);
}

/// Check if the string contains only numbers
class NumericValidator extends Validator {
  @override
  bool validate(String str) => validator.isNumeric(str);
}

/// Check if the string contains any surrogate pairs chars
class SurrogatePairValidator extends Validator {
  @override
  bool validate(String str) => validator.isSurrogatePair(str);
}

/// Check if the string is uppercase
class UppercaseValidator extends Validator {
  @override
  bool validate(String str) => validator.isUppercase(str);
}

/// Check if the string is a URL
class URLValidator extends Validator {
  URLValidator({
    this.protocols = const ['http', 'https', 'ftp'],
    this.hostWhitelist = const [],
    this.hostBlacklist = const [],
    this.requireTld = true,
    this.requireProtocol = false,
    this.allowUnderscore = false,
  });

  final List<String> protocols, hostWhitelist, hostBlacklist;
  final bool requireTld, requireProtocol, allowUnderscore;

  @override
  bool validate(String str) => validator.isURL(
        str,
        allowUnderscore: allowUnderscore,
        hostBlacklist: hostBlacklist,
        hostWhitelist: hostWhitelist,
        protocols: protocols,
        requireProtocol: requireProtocol,
        requireTld: requireTld,
      );
}

/// Check if the string is a UUID (version 3, 4 or 5)
class UUIDValidator extends Validator {
  UUIDValidator([/* <String | int> */ this.version]);

  final dynamic version;

  @override
  bool validate(String str) => validator.isUUID(str, version);
}

/// Check if the string contains a mixture of full and half-width chars
class VariableWidthValidator extends Validator {
  @override
  bool validate(String str) => validator.isVariableWidth(str);
}

/// Check if string matches the pattern
class MatchesValidator extends Validator {
  MatchesValidator(this.pattern);

  final dynamic pattern;

  @override
  bool validate(String str) => validator.matches(str, pattern);
}
