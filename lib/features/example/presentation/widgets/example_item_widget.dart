import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/core/config/router/app_routes.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';
import 'package:boilerplate_riverpod/features/example/presentation/controllers/example_controller.dart';

class ExampleItemWidget extends StatelessWidget {
  final Example example;
  final WidgetRef ref;

  const ExampleItemWidget({
    super.key,
    required this.example,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: TextButton(
          onPressed: () {
            context.push(AppRoutes.editExamplePath(example.id));
          },
          child: Text(example.title),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            ref
                .read(exampleControllerProvider.notifier)
                .deleteExample(example.id);
          },
        ),
      ),
    );
  }
}
