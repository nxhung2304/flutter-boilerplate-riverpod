import 'package:flutter/material.dart';
import 'package:boilerplate_riverpod/features/example/data/models/params/example_params.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';

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
    final hasTitle = titleController.text.trim().isNotEmpty;

    isValid.value = hasTitle;
  }

  ExampleParams toParams() {
    return ExampleParams(
      title: titleController.text.trim(),
    );
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
