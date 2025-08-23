import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:boilerplate_riverpod/core/config/router/app_routes.dart';
import 'package:boilerplate_riverpod/features/example/strings/example_strings.dart';
import 'package:boilerplate_riverpod/features/home/presentation/strings/home_strings.dart';
import 'package:boilerplate_riverpod/shared/enums/navigation_item.dart';
import 'package:boilerplate_riverpod/shared/models/navigation_destination_model.dart';

class SharedBottomNav extends StatelessWidget {
  final String currentRoute;

  const SharedBottomNav({super.key, required this.currentRoute});

  List<NavigationDestinationModel> get _destinations => [
        NavigationDestinationModel(
          icon: Icons.home,
          label: HomeStrings.title,
          route: AppRoutes.home,
        ),
        NavigationDestinationModel(
          icon: Icons.task,
          label: ExampleStrings.title,
          route: AppRoutes.example,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _getCurrentIndex(),
      onDestinationSelected: (index) => _navigateToTab(context, index),
      destinations: _destinations
          .map(
            (dest) => NavigationDestination(
              icon: Icon(dest.icon),
              label: dest.label,
            ),
          )
          .toList(),
    );
  }

  int _getCurrentIndex() {
    return NavigationItem.fromRoute(currentRoute).index;
  }

  void _navigateToTab(BuildContext context, int index) {
    final destination = _destinations[index];
    context.go(destination.route);
  }
}
