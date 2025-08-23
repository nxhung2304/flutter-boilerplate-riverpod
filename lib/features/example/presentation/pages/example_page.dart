import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/core/config/router/app_routes.dart';
import 'package:boilerplate_riverpod/features/example/presentation/controllers/example_controller.dart';
import 'package:boilerplate_riverpod/features/example/presentation/widgets/example_item_widget.dart';
import 'package:boilerplate_riverpod/features/example/strings/example_strings.dart';
import 'package:boilerplate_riverpod/shared/theme/app_spacing.dart';
import 'package:boilerplate_riverpod/shared/widgets/layout/shared_scaffold.dart';

class ExamplePage extends HookConsumerWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examplesAsync = ref.watch(exampleControllerProvider);

    return SharedScaffold(
      body: Column(
        children: [
          _buildAddButton(context),
          Expanded(child: _buildExampleList(examplesAsync, ref, context)),
        ],
      ),
      title: ExampleStrings.title,
      currentRoute: AppRoutes.example,
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: ElevatedButton(
        onPressed: () => context.push(AppRoutes.newExample),
        child: Text(ExampleStrings.create),
      ),
    );
  }

  Widget _buildExampleList(
    AsyncValue<List<dynamic>> examplesAsync,
    WidgetRef ref,
    BuildContext context,
  ) {
    return examplesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: AppSpacing.xxl, color: Colors.red),
            const SizedBox(height: AppSpacing.md),
            Text('Error: $error'),
            const SizedBox(height: AppSpacing.md),
            ElevatedButton(
              onPressed: () => ref.invalidate(exampleControllerProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      data: (examples) => _buildExampleListView(examples, ref, context),
    );
  }

  Widget _buildExampleListView(
    List<dynamic> examples,
    WidgetRef ref,
    BuildContext context,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: examples.length,
      itemBuilder: (BuildContext context, int index) {
        final example = examples[index];
        return ExampleItemWidget(example: example, ref: ref);
      },
    );
  }
}
