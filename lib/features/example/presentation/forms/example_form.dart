import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/features/example/data/models/params/example_params.dart';
import 'package:boilerplate_riverpod/features/example/data/providers/example_providers.dart';
import 'package:boilerplate_riverpod/features/example/presentation/forms/hooks/use_example_form.dart';
import 'package:boilerplate_riverpod/features/example/presentation/validators/example_validators.dart';
import 'package:boilerplate_riverpod/features/example/strings/example_strings.dart';
import 'package:boilerplate_riverpod/shared/enums/form_mode.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';
import 'package:boilerplate_riverpod/shared/theme/app_spacing.dart';

class ExampleForm extends HookConsumerWidget {
  final FormMode mode;
  final int? exampleId;
  final Future<void> Function(ExampleParams) onSubmit;

  const ExampleForm.create({super.key, required this.onSubmit})
    : mode = FormMode.create,
      exampleId = null;

  const ExampleForm.edit({
    super.key,
    required this.exampleId,
    required this.onSubmit,
  }) : mode = FormMode.edit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = mode == FormMode.edit;

    Example? initialExample;
    bool isLoading = false;
    String? errorMessage;

    if (isEdit && exampleId != null) {
      final exampleAsync = ref.watch(exampleByIdProvider(exampleId!));

      isLoading = exampleAsync.isLoading && !exampleAsync.hasValue;

      if (exampleAsync.hasError) {
        errorMessage = exampleAsync.asError?.error.toString();
      } else {
        final response = exampleAsync.value;
        if (response?.isError == true) {
          errorMessage = response?.error;
        } else {
          initialExample = response?.data;
        }
      }
    }

    final formState = useExampleForm(initialExample: initialExample);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text('Error: $errorMessage'));
    }

    return Form(
      key: formState.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            _buildTitleField(formState.titleController),
            const SizedBox(height: AppSpacing.md),
            ElevatedButton(
              onPressed: () {
                if (formState.formKey.currentState?.validate() ?? false) {
                  final params = formState.toParams();
                  onSubmit(params);
                }
              },
              child: Text(
                isEdit ? ExampleStrings.update : ExampleStrings.create,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ExampleStrings.name),
        TextFormField(
          controller: controller,
          validator: ExampleValidators.validateTitle,
        ),
      ],
    );
  }
}
