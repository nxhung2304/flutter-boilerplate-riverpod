import 'package:boilerplate_riverpod/core/config/router/app_routes.dart';
import 'package:boilerplate_riverpod/features/example/strings/example_strings.dart';
import 'package:boilerplate_riverpod/features/home/presentation/strings/home_strings.dart';
import 'package:boilerplate_riverpod/shared/models/navigation_destination_model.dart';
import 'package:flutter/material.dart';

List<NavigationDestinationModel> navigationDestinations = [
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
