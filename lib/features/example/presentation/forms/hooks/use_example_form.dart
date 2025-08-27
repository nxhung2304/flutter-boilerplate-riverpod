import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';
import 'package:boilerplate_riverpod/features/example/presentation/forms/example_form_state.dart';

ExampleFormState useExampleForm({Example? initialExample}) {
  final titleController = useTextEditingController();
  final formKey = useMemoized(() => GlobalKey<FormState>());
  final isValid = useState(false);

  final formState = useMemoized(
    () => ExampleFormState(
      titleController: titleController,
      formKey: formKey,
      isValid: isValid,
    ),
  );

  useEffect(() {
    Timer? debounceTimer;
    
    void onTextChanged() {
      debounceTimer?.cancel();
      debounceTimer = Timer(const Duration(milliseconds: 300), () {
        formState.validateForm();
      });
    }

    titleController.addListener(onTextChanged);

    return () {
      debounceTimer?.cancel();
      titleController.removeListener(onTextChanged);
    };
  }, [titleController]);

  useEffect(() {
    if (initialExample != null) {
      formState.fillFromExample(initialExample);
    }

    return null;
  }, [initialExample]);

  useEffect(() {
    return () => formState.dispose();
  }, []);

  return formState;
}
