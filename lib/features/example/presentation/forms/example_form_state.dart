import 'package:flutter/material.dart';
import 'package:boilerplate_riverpod/features/example/data/models/params/example_params.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';
import 'package:boilerplate_riverpod/features/example/presentation/validators/example_validators.dart';

class ExampleFormState {
  final TextEditingController titleController;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> isValid;

  ExampleFormState({
    required this.titleController,
    required this.formKey,
    required this.isValid,
  });

  void validateForm() {
    final titleValid =
        ExampleValidators.validateTitle(titleController.text) == null;

    isValid.value = titleValid;
  }

  ExampleParams toParams() {
    return ExampleParams(title: titleController.text.trim());
  }

  void reset() {
    titleController.clear();
    isValid.value = false;
  }

  void dispose() {
    titleController.dispose();
    isValid.dispose();
  }

  void fillFromExample(Example example) {
    titleController.text = example.title;

    validateForm();
  }
}
