# Lista de Validators

| Validator                                                              | Description                                                                     |
| :--------------------------------------------------------------------- | :------------------------------------------------------------------------------ |
| Validators.alpha                                                       | Check if the string contains only letters (a-zA-Z)                              |
| Validators.alphanumeric                                                | Check if the string str contains only letters and numbers                       |
| Validators.ascii                                                       | Check if the string contains ASCII chars only                                   |
| Validators.base64                                                      | Check if a string is base64 encoded                                             |
| Validators.creditCard                                                  | Check if the string is a credit card                                            |
| Validators.date                                                        | Check if the string is a date                                                   |
| Validators.email                                                       | Check if the string is an email                                                 |
| Validators.fullWidth                                                   | Check if the string contains any full-width chars                               |
| Validators.halfWidth                                                   | Check if the string contains any half-width chars                               |
| Validators.hexadecimal                                                 | Check if the string is a hexadecimal number                                     |
| Validators.hexColor                                                    | Check if the string str is a hexadecimal color                                  |
| Validators.isFloat                                                     | Check if the string is a float                                                  |
| Validators.isInt                                                       | Check if the string is an integer                                               |
| Validators.json                                                        | Check if the string is valid JSON                                               |
| Validators.lowercase                                                   | Check if the string is lowercase                                                |
| Validators.mongoId                                                     | Check if the string is a valid hex-encoded representation of a MongoDB ObjectId |
| Validators.multibyte                                                   | Check if the string contains one or more multibyte chars                        |
| Validators.numeric                                                     | Check if the string contains only numbers                                       |
| Validators.required                                                    | Check if the input has some value                                               |
| Validators.surrogatePair                                               | Check if the string contains any surrogate pairs chars                          |
| Validators.uppercase                                                   | Check if the string is uppercase                                                |
| Validators.variableWidth                                               | Check if the string contains a mixture of full and half-width chars             |
| Validators.after(dynamic date)                                         | Check if the string is a date that's after the specified date                   |
| Validators.byteLength(int min, [int max])                              | Check if the string is a date that's before the specified date                  |
| Validators.contains(dynamic seed)                                      | Check if the string contains the seed                                           |
| Validators.divisibleBy(dynamic n)                                      | Check if the string is a number that's divisible by another                     |
| Validators.equals(dynamic comparison)                                  | Check if the string matches the comparison                                      |
| Validators.fqnd({bool requireTld: true, bool allowUnderscores: false}) | Check if the string is a fully qualified domain name (e.g. domain.com)          |
| Validators.inValues(List values)                                       | Check if the string is in a array of allowed values                             |
| Validators.ip([dynamic version])                                       | Check if the string is IP version 4 or 6                                        |
| Validators.isBefore(dynamic date)                                      | Check if the string is a date that's before the specified date                  |
| Validators.isbn([dynamic version])                                     | Check if the string is an ISBN (version 10 or 13)                               |
| Validators.length(int min, [int max])                                  | Check if the length of the string str falls in a range                          |
| Validators.matches(dynamic pattern)                                    | Check if string matches the pattern                                             |
| Validators.maxLength(int max)                                          | Check if the length of the input value is more than or equal to max             |
| Validators.minLength(int min)                                          | Check if the length of the input value is less than or equal to min             |
| Validators.uuid([dynamic version])                                     | Check if the string is a UUID (version 3, 4 or 5)                               |