import 'package:boilerplate_riverpod/features/example/strings/example_error_strings.dart';

class ExampleValidators {
  static const int minLength = 3;
  static const int maxLength = 100;

  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ExampleErrorStrings.nameRequired;
    }
    if (value.trim().length < minLength) {
      return ExampleErrorStrings.nameMinLength;
    }
    if (value.length > maxLength) {
      return ExampleErrorStrings.nameMaxLength;
    }

    return null;
  }
}
