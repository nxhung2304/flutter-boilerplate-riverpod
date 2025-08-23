import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/core/config/router/app_routes.dart';
import 'package:boilerplate_riverpod/features/home/presentation/strings/home_strings.dart';
import 'package:boilerplate_riverpod/shared/widgets/layout/shared_scaffold.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      body: Text(HomeStrings.title),
      title: HomeStrings.title,
      currentRoute: AppRoutes.home,
    );
  }
}
