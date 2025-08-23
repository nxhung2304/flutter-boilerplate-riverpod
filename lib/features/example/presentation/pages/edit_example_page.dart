import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/core/config/router/app_routes.dart';
import 'package:boilerplate_riverpod/features/example/data/models/params/example_params.dart';
import 'package:boilerplate_riverpod/features/example/presentation/controllers/example_controller.dart';
import 'package:boilerplate_riverpod/features/example/presentation/forms/example_form.dart';
import 'package:boilerplate_riverpod/features/example/strings/example_strings.dart';
import 'package:boilerplate_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:boilerplate_riverpod/shared/widgets/notifications/app_snackbar.dart';

class EditExamplePage extends HookConsumerWidget {
  final int exampleId;

  const EditExamplePage({super.key, required this.exampleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onSubmit(
      BuildContext context,
      WidgetRef ref,
      ExampleParams params,
    ) async {
      try {
        final controller = ref.read(exampleControllerProvider.notifier);

        final result = await controller.updateExample(exampleId, params);

        if (!context.mounted) return;

        if (result.isSuccess) {
          AppSnackBar.showSuccess(context, ExampleStrings.updateSuccess);
          context.pop();
        } else {
          AppSnackBar.showError(context, ExampleStrings.updateError);
        }
      } catch (e) {
        AppSnackBar.showError(context, e.toString());
      }
    }

    return SharedScaffold(
      title: ExampleStrings.title,
      currentRoute: AppRoutes.editExamplePath(exampleId),
      body: ExampleForm.edit(
        exampleId: exampleId,
        onSubmit: (params) => onSubmit(context, ref, params),
      ),
    );
  }
}
