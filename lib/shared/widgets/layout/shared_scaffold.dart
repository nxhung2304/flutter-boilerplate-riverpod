import 'package:boilerplate_riverpod/core/extensions/media_query_extension.dart';
import 'package:boilerplate_riverpod/shared/widgets/layout/mobile_app_bar.dart';
import 'package:boilerplate_riverpod/shared/widgets/layout/web_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/shared/widgets/layout/shared_bottom_nav.dart';

class SharedScaffold extends ConsumerWidget {
  final String title;
  final Widget body;
  final String currentRoute;
  final List<Widget>? appBarActions;
  final FloatingActionButton? floatingActionButton;
  final bool showBottomNav;
  final bool showAppBar;
  final bool centerTitle;
  final Color? appBarBackgroundColor;
  final Widget? customWebLeading;

  const SharedScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.currentRoute,
    this.appBarActions,
    this.floatingActionButton,
    this.showBottomNav = true,
    this.showAppBar = true,
    this.centerTitle = true,
    this.appBarBackgroundColor,
    this.customWebLeading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _appBar() {
      if (!showAppBar) return null;

      if (kIsWeb) {
        return WebAppBar(
          title: title,
          actions: appBarActions,
          customLeading: customWebLeading,
        );
      }

      return MobileAppBar(
        title: title,
        centerTitle: centerTitle,
        actions: appBarActions,
        backgroundColor: appBarBackgroundColor,
      );
    }

    _bottomNav() {
      if (!showBottomNav || !context.isMobile) return null;

      return SharedBottomNav(currentRoute: currentRoute);
    }

    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNav(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
