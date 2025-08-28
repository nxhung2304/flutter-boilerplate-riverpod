import 'package:boilerplate_riverpod/shared/constants/navigation.dart';
import 'package:boilerplate_riverpod/shared/models/navigation_destination_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? customLeading;

  const WebAppBar({
    super.key,
    required this.title,
    this.actions,
    this.customLeading,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = navigationDestinations;
    final defaultLeadingWidth = 100.0;

    return AppBar(
      leading: customLeading ?? _buildDefaultLeading(),
      leadingWidth: defaultLeadingWidth,
      title: _buildNavigationRow(context, navItems),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _buildNavigationRow(
    BuildContext context,
    List<NavigationDestinationModel> items,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: items.map((item) => _buildNavItem(context, item)).toList(),
    );
  }

  Widget _buildDefaultLeading() {
    return Center(child: Text(title, style: const TextStyle(fontSize: 16)));
  }

  Widget _buildNavItem(BuildContext context, NavigationDestinationModel item) {
    final currentRoute = GoRouterState.of(context).uri.path;
    final isActive = currentRoute == item.route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton.icon(
        onPressed: () {
          if (currentRoute != item.route) {
            context.go(item.route);
          }
        },
        icon: Icon(
          item.icon,
          color: isActive ? Colors.white : Colors.white70,
          size: 20,
        ),
        label: Text(
          item.label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white70,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
