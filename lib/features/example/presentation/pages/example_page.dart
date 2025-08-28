import 'package:boilerplate_riverpod/core/services/firebase/analytics_service.dart';
import 'package:boilerplate_riverpod/features/example/presentation/widgets/example_skeleton_item.dart';
import 'package:boilerplate_riverpod/shared/widgets/loading/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final isLoadingDemo = useState(false);

    return SharedScaffold(
      body: LoadingOverlay(
        isLoading: isLoadingDemo.value,
        child: Column(
          children: [
            _buildButtons(context, isLoadingDemo),
            Expanded(
              child: _buildExampleList(
                examplesAsync,
                ref,
                context,
                isLoadingDemo,
              ),
            ),
          ],
        ),
      ),
      title: ExampleStrings.title,
      currentRoute: AppRoutes.example,
    );
  }

  Widget _buildButtons(
    BuildContext context,
    ValueNotifier<bool> isLoadingDemo,
  ) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.push(AppRoutes.newExample),
            child: Text(ExampleStrings.create),
          ),
          const SizedBox(height: AppSpacing.sm),
          Column(
            children: [
              ElevatedButton(
                onPressed: () => _showLoadingDemo(isLoadingDemo),
                child: const Text('Demo Loading'),
              ),
              const SizedBox(width: AppSpacing.sm),
              ElevatedButton(
                onPressed: () => throw Exception(),
                child: const Text("Throw Test Exception"),
              ),
              ElevatedButton(
                onPressed: () {
                  AnalyticsService.logEvent(
                    name: "test_event",
                    parameters: {"param1": "value1"},
                  );
                },
                child: const Text("Send Test Analytics Event"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLoadingDemo(ValueNotifier<bool> isLoadingDemo) async {
    isLoadingDemo.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoadingDemo.value = false;
  }

  Widget _buildExampleList(
    AsyncValue<List<dynamic>> examplesAsync,
    WidgetRef ref,
    BuildContext context,
    ValueNotifier<bool> isLoadingDemo,
  ) {
    return examplesAsync.when(
      loading: () => _buildSkeletonList(),
      error:
          (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  size: AppSpacing.xxl,
                  color: Colors.red,
                ),
                const SizedBox(height: AppSpacing.md),
                Text('Error: $error'),
                const SizedBox(height: AppSpacing.md),
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

  Widget _buildSkeletonList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (context, index) => const ExampleSkeletonItem(),
    );
  }
}
