import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:boilerplate_riverpod/core/config/router/app_routes.dart';
import 'package:boilerplate_riverpod/features/example/presentation/pages/edit_example_page.dart';
import 'package:boilerplate_riverpod/features/example/presentation/pages/new_example_page.dart';
import 'package:boilerplate_riverpod/features/example/presentation/pages/example_page.dart';
import 'package:boilerplate_riverpod/features/example/strings/example_error_strings.dart';
import 'package:boilerplate_riverpod/features/home/presentation/pages/home_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  },
  routes: [
    GoRoute(path: AppRoutes.home, builder: (context, state) => HomePage()),
    GoRoute(
      path: AppRoutes.example,
      builder: (context, state) => ExamplePage(),
      routes: [
        GoRoute(path: 'new', builder: (context, state) => NewExamplePage()),
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) {
            final exampleIdString = state.pathParameters['id'];
            if (exampleIdString == null) {
              return Text(ExampleErrorStrings.idNotFound);
            }

            final exampleId = int.tryParse(exampleIdString);
            if (exampleId == null) {
              return Text(ExampleErrorStrings.idNotFound);
            }

            return EditExamplePage(exampleId: exampleId);
          },
        ),
      ],
    ),
  ],
);
