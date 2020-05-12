import 'validator.dart';

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
  static Validator get required => RequiredValidator();

  /// Check if the length of the input value is less than or equal to [min]
  static Validator minLength(int min) => MinLengthValidator(min);

  /// Check if the length of the input value is more than or equal to [max]
  static Validator maxLength(int max) => MaxLengthValidator(max);

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
