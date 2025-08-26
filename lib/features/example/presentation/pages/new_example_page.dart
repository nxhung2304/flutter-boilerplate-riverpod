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

class NewExamplePage extends HookConsumerWidget {
  const NewExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> _onSubmit(
      BuildContext context,
      WidgetRef ref,
      ExampleParams exampleParams,
    ) async {
      final result = await ref
          .read(exampleControllerProvider.notifier)
          .createExample(exampleParams);

      if (!context.mounted) return;

      if (result.isSuccess) {
        AppSnackBar.showSuccess(context, ExampleStrings.createSuccess);
        context.pop();
      } else {
        AppSnackBar.showError(context, result.error.toString());
      }
    }

    return PopScope(
      child: SharedScaffold(
        title: ExampleStrings.createTitle,
        currentRoute: AppRoutes.example,
        body: ExampleForm.create(
          onSubmit:
              (ExampleParams exampleParams) =>
                  _onSubmit(context, ref, exampleParams),
        ),
      ),
    );
  }
}
