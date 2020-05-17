library validator;

import 'package:validators/validators.dart' as validator;

abstract class Validator {
  bool validate(String str);

  String _customErrorText;

  String get errorText;

  String get customErrorText => _customErrorText;

  void msg(String msg) => _customErrorText = msg;
}

/// Check if the string contains the seed
class ContainsValidator extends Validator {
  ContainsValidator(this.seed);

  final dynamic seed;

  @override
  bool validate(String str) => validator.contains(str, seed);

  @override
  String get errorText => "Input should contains \"$seed\" seed";
}

/// Check if the string matches the comparison
class EqualsValidator extends Validator {
  EqualsValidator(this.comparison);

  final dynamic comparison;

  @override
  bool validate(String str) => validator.equals(str, comparison);

  @override
  String get errorText => "Input shoud be equals to $comparison";
}

/// Check if the string is a date that's after the specified date
class AfterValidator extends Validator {
  AfterValidator([this.date]);

  final dynamic date;

  @override
  bool validate(String str) => validator.isAfter(str, date);

  @override
  String get errorText =>
      "Input should be a date that's after that ${date.toString()}";
}

/// Check if the string contains only letters (a-zA-Z)
class AlphaValidator extends Validator {
  @override
  bool validate(String str) => validator.isAlpha(str);

  @override
  String get errorText => "Input should contains only letters (a-zA-Z)";
}

/// Check if the string contains only letters and numbers
class AlphanumericValidator extends Validator {
  @override
  bool validate(String str) => validator.isAlphanumeric(str);

  @override
  String get errorText => "Input shoud contains only letters and numbers";
}

/// Check if the string contains ASCII chars only
class AsciiValidator extends Validator {
  @override
  bool validate(String str) => validator.isAscii(str);

  @override
  String get errorText => "Input should contains ASCII chars only";
}

/// Check if a string is base64 encoded
class Base64Validator extends Validator {
  @override
  bool validate(String str) => validator.isBase64(str);

  @override
  String get errorText => "Input should be base64 encoded";
}

/// Check if the string is a date that's before the specified date
class BeforeValidator extends Validator {
  BeforeValidator([this.date]);

  final dynamic date;

  @override
  bool validate(String str) => validator.isBefore(str, date);

  @override
  String get errorText =>
      "Input should be a date that's before that ${date.toString()}";
}

/// Check if the string's length (in bytes) falls in a range.
class ByteLengthValidator extends Validator {
  ByteLengthValidator(this.min, [this.max]);

  final int min, max;

  @override
  bool validate(String str) => validator.isByteLength(str, min, max);

  @override
  String get errorText => "Input length (in bytes) falls in a range";
}

/// Check if the string is a credit card
class CreditCardValidator extends Validator {
  @override
  bool validate(String str) => validator.isCreditCard(str);

  @override
  String get errorText => "Input shoud contains a valid credit card";
}

/// Check if the string is a date
class DateValidator extends Validator {
  @override
  bool validate(String str) => validator.isDate(str);

  @override
  String get errorText => "Input should be a date";
}

/// Check if the string is a number that's divisible by another
class DivisibleByValidator extends Validator {
  DivisibleByValidator(this.n);

  final dynamic n;

  @override
  bool validate(String str) => validator.isDivisibleBy(str, n);

  @override
  String get errorText =>
      "Input should be a number that's divisible by another";
}

/// Check if the string is an email
class EmailValidator extends Validator {
  @override
  bool validate(String str) => validator.isEmail(str);

  @override
  String get errorText => "Input shoud contains a valid email";
}

/// Check if the string is a float
class FloatValidator extends Validator {
  @override
  bool validate(String str) => validator.isFloat(str);

  @override
  String get errorText => "Input shoud be a float number";
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

  @override
  String get errorText =>
      "Input shoud contains a fully qualified domain name (e.g. domain.com)";
}

/// Check if the string contains any full-width chars
class FullWidthValidator extends Validator {
  @override
  bool validate(String str) => validator.isFullWidth(str);

  @override
  String get errorText => "Input should contains any full-width chars";
}

/// Check if the string contains any half-width chars
class HalfWidthValidator extends Validator {
  @override
  bool validate(String str) => validator.isHalfWidth(str);

  @override
  String get errorText => "Input should contains any half-width chars";
}

/// Check if the string is a hexadecimal number
class HexadecimalValidator extends Validator {
  @override
  bool validate(String str) => validator.isHexadecimal(str);

  @override
  String get errorText => "Input shoud contains a hexadecimal number";
}

/// Check if the string is a hexadecimal color
class HexColorValidator extends Validator {
  @override
  bool validate(String str) => validator.isHexColor(str);

  @override
  String get errorText => "Input should contains a hexadecimal color";
}

/// Check if the string is in a array of allowed values
class InValidator extends Validator {
  InValidator(this.values);

  final List<dynamic> values;

  @override
  bool validate(String str) => validator.isIn(str, values);

  @override
  String get errorText => "Input shound contains in a array of allowed values";
}

/// Check if the string is an integer
class IntValidator extends Validator {
  @override
  bool validate(String str) => validator.isInt(str);

  @override
  String get errorText => "Input should contains an integer";
}

/// Check if the string is IP version 4 or 6
class IPValidator extends Validator {
  IPValidator([/* <String | int> */ this.version]);

  final dynamic version;

  @override
  bool validate(String str) => validator.isIP(str, version);

  @override
  String get errorText => "Input should contains a valid IP version 4 or 6";
}

/// Check if the string is an ISBN (version 10 or 13)
class ISBNValidator extends Validator {
  ISBNValidator([/* <String | int> */ this.version]);

  final dynamic version;

  @override
  bool validate(String str) => validator.isISBN(str, version);

  @override
  String get errorText =>
      "Input should contains a valid ISBN (version 10 or 13)";
}

/// Check if the string is valid JSON
class JsonValidator extends Validator {
  @override
  bool validate(String str) => validator.isJSON(str);

  @override
  String get errorText => "Input should contains a valid JSON";
}

/// Check if the length of the string falls in a range
class LengthValidator extends Validator {
  LengthValidator(this.min, [this.max]);

  final int min, max;

  @override
  bool validate(String str) => validator.isLength(str, min, max);

  @override
  String get errorText => "Input should falls in a range";
}

/// Check if the string is lowercase
class LowercaseValidator extends Validator {
  @override
  bool validate(String str) => validator.isLowercase(str);

  @override
  String get errorText => "Input should be lowercase";
}

/// Check if the string is a valid hex-encoded representation of a MongoDB ObjectId
class MongoIdValidator extends Validator {
  @override
  bool validate(String str) => validator.isMongoId(str);

  @override
  String get errorText =>
      "Input should contains a valid hex-encoded representation of a MongoDB ObjectId";
}

/// Check if the string contains one or more multibyte chars
class MultibyteValidator extends Validator {
  @override
  bool validate(String str) => validator.isMultibyte(str);

  @override
  String get errorText => "Input should contains one or more multibyte chars";
}

/// Check if the string contains only numbers
class NumericValidator extends Validator {
  @override
  bool validate(String str) => validator.isNumeric(str);

  @override
  String get errorText => "Input should contains only numbers";
}

/// Check if the string contains any surrogate pairs chars
class SurrogatePairValidator extends Validator {
  @override
  bool validate(String str) => validator.isSurrogatePair(str);

  @override
  String get errorText => "Input should contains any surrogate pairs chars";
}

/// Check if the string is uppercase
class UppercaseValidator extends Validator {
  @override
  bool validate(String str) => validator.isUppercase(str);

  @override
  String get errorText => "Input should be uppercase";
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

  @override
  String get errorText => "Input should contains a valid URL";
}

/// Check if the string is a UUID (version 3, 4 or 5)
class UUIDValidator extends Validator {
  UUIDValidator([/* <String | int> */ this.version]);

  final dynamic version;

  @override
  bool validate(String str) => validator.isUUID(str, version);

  @override
  String get errorText =>
      "Input should contains a valid UUID (version 3, 4 or 5)";
}

/// Check if the string contains a mixture of full and half-width chars
class VariableWidthValidator extends Validator {
  @override
  bool validate(String str) => validator.isVariableWidth(str);

  @override
  String get errorText =>
      "Input should contains a mixture of full and half-width chars";
}

/// Check if string matches the pattern
class MatchesValidator extends Validator {
  MatchesValidator(this.pattern);

  final dynamic pattern;

  @override
  bool validate(String str) => validator.matches(str, pattern);

  @override
  String get errorText => "Input should matches the pattern";
}

/// Check if the length of the input value is less than or equal to [min]
class MinLengthValidator extends Validator {
  MinLengthValidator(this.min);

  final int min;

  @override
  bool validate(String str) => str.length >= min;

  @override
  String get errorText =>
      "Please lengthen this text to $min characters or more";
}

/// Check if the length of the input value is more than or equal to [max]
class MaxLengthValidator extends Validator {
  MaxLengthValidator(this.max);

  final int max;

  @override
  bool validate(String str) => str.length > max;

  @override
  String get errorText => "Input length should be more than or equal to $max";
}

/// Check if the length of the input value is more than or equal to [max]
class RequiredValidator extends Validator {
  @override
  bool validate(String str) => str.trim().isNotEmpty;

  @override
  String get errorText => "This field is required";
}

class StrongPasswordValidator extends Validator {
  @override
  bool validate(String str) {
    String regex = r"^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{6,}$";

    return RegExp(regex).hasMatch(str);
  }

  @override
  String get errorText => "Forneça uma senha mais forte";
}
