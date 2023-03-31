import 'package:flutter/material.dart';

mixin RouteDestination {
  String get initialLocation;
}

/// Representation of a tab item in a [ScaffoldWithNavBar]
/// Ну, тут ничего необычного. Просто итемы с раутом, по которому нужно перейти. 
class ScaffoldWithNavigationTabItem extends NavigationDestination 
    with RouteDestination {
  @override
  final String initialLocation;

  const ScaffoldWithNavigationTabItem({
    super.key, 
    required this.initialLocation,
    required Widget icon, 
    Widget? selectedIcon, 
    String? label
  }) : super(
    selectedIcon: selectedIcon,
    icon: icon, 
    label: label ?? "some"
  );
}

class ScaffoldWithNavigationDrawerItem extends NavigationDrawerDestination 
    with RouteDestination {
  @override
  final String initialLocation;

  const ScaffoldWithNavigationDrawerItem({
    super.key,
    required this.initialLocation,
    required Widget icon,
    Widget? selectedIcon,
    required Widget label
  }) : super(
    selectedIcon: selectedIcon,
    icon: icon,
    label: label
  );

  toRailDestination() {
    return NavigationRailDestination(
      selectedIcon: selectedIcon,
      icon: icon, 
      label: label
    );
  }
}