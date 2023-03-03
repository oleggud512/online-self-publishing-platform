import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/features/home/presentation/home_screen_app_bar.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/messages/presentation/chats/chats_screen_app_bar.dart';
import 'package:client/src/features/profile/presentation/authors/authors_screen_app_bar.dart';
import 'package:client/src/router/router.dart';
import 'package:client/src/router/scaffold_with_bottom_nav_bar_item.dart';
import 'package:client/src/router/shell_scaffold_key.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../features/books/presentation/books/books_screen_app_bar.dart';

class ScaffoldWithNavigation extends ConsumerStatefulWidget {
  const ScaffoldWithNavigation({
    super.key, 
    required this.child
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScaffoldWithNavigationState();
}
class _ScaffoldWithNavigationState extends ConsumerState<ScaffoldWithNavigation> {

  late List<ScaffoldWithNavigationTabItem> primaryTabs;
  late List<ScaffoldWithNavigationDrawerItem> primaryDrawerTabs;
  late List<ScaffoldWithNavigationDrawerItem> secondaryDrawerTabs;

  GlobalKey<ScaffoldState> get scaffoldKey => ref.watch(shellScaffoldKeyProvider);

  void initTabs() {
    final ll = ref.read(currentLocalizationProvider);

    primaryTabs = [
      ScaffoldWithNavigationTabItem(
        initialLocation: MyRoute.home.path,
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: ll.screenTitle.home,
      ),
      ScaffoldWithNavigationTabItem(
        initialLocation: MyRoute.chats.path,
        icon: const Icon(Icons.message_outlined),
        selectedIcon: const Icon(Icons.message),
        label: ll.screenTitle.messages,
      ),
      ScaffoldWithNavigationTabItem(
        initialLocation: MyRoute.books.path,
        icon: const Icon(Icons.book_outlined),
        selectedIcon: const Icon(Icons.book),
        label: ll.screenTitle.books,
      ),
      ScaffoldWithNavigationTabItem(
        initialLocation: MyRoute.profiles.path,
        icon: const Icon(Icons.people_alt_outlined),
        selectedIcon: const Icon(Icons.people_alt),
        label: ll.screenTitle.authors,
      ),
      ScaffoldWithNavigationTabItem(
        initialLocation: MyRoute.myProfile.path,
        icon: const Icon(Icons.person_outline),
        selectedIcon: const Icon(Icons.person),
        label: ll.screenTitle.profile,
      ),
    ];

    primaryDrawerTabs = primaryTabs.map(
      (t) => ScaffoldWithNavigationDrawerItem(
        initialLocation: t.initialLocation, 
        icon: t.icon, 
        selectedIcon: t.selectedIcon,
        label: Text(t.label)
      )
    ).toList();

    secondaryDrawerTabs = [
      ScaffoldWithNavigationDrawerItem(
        initialLocation: MyRoute.notifications.path,
        icon: const Icon(Icons.notifications_outlined),
        selectedIcon: const Icon(Icons.notifications),
        label: Text(ll.screenTitle.notifications),
      ),
      ScaffoldWithNavigationDrawerItem(
        initialLocation: MyRoute.bookmarks.path,
        icon: const Icon(Icons.bookmark_outline),
        selectedIcon: const Icon(Icons.bookmark),
        label: Text(ll.screenTitle.bookmarks),
      ),
      ScaffoldWithNavigationDrawerItem(
        initialLocation: MyRoute.settings.path,
        icon: const Icon(Icons.settings_outlined),
        selectedIcon: const Icon(Icons.settings),
        label: Text(ll.screenTitle.settings),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    
    initTabs();
  }

  String get curLocation => GoRouter.of(context).location;
  int get drawerSelected {
    return [...primaryDrawerTabs, ...secondaryDrawerTabs].indexWhere(
      (t) => t.initialLocation.startsWith(curLocation)
    );
  }
  int get tabSelected {
    int selected = primaryTabs.indexWhere(
      (t) => t.initialLocation.startsWith(curLocation)
    );
    if (selected == -1 || selected >= primaryTabs.length) return 0;
    return selected;
  }

  void onDestinationSelected(BuildContext context, int index) {
    if (index == drawerSelected) return;

    if (index < primaryTabs.length) {
      context.go(primaryTabs[index].initialLocation);
    } else if (drawerSelected >= primaryTabs.length) {
      context.pushReplacement(
        [...primaryDrawerTabs, ...secondaryDrawerTabs][index]
          .initialLocation);
    } else {
      context.push(
        [...primaryDrawerTabs, ...secondaryDrawerTabs][index]
          .initialLocation);
    }
    scaffoldKey.currentState?.closeDrawer();
  }

  PreferredSizeWidget? get appBar {
    if (primaryTabs.indexWhere((t) => t.initialLocation == curLocation) == -1) {
      return null;
    }
    final path = primaryTabs[tabSelected].initialLocation;
    return null;
  } 

  @override
  Widget build(BuildContext context) {
    ref.listen(currentLocalizationProvider, (p, n) => initTabs());
    printInfo("build ScaffoldWithNavigation $drawerSelected $tabSelected");
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      drawer: NavigationDrawer(
        selectedIndex: drawerSelected,
        children: [
          ...primaryDrawerTabs,
          const Divider(),
          ...secondaryDrawerTabs
        ],
        onDestinationSelected: (index) {
          onDestinationSelected(context, index);
        },
      ) ,
      body: widget.child,
      bottomNavigationBar: (!secondaryDrawerTabs.map((t) => t.initialLocation).contains(curLocation)) 
        ? NavigationBar(
          selectedIndex: tabSelected,
          onDestinationSelected: (index) {
            onDestinationSelected(context, index);
          },
          destinations: primaryTabs
        ) 
        : null
    );
  }
}