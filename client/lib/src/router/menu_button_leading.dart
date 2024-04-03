import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/router/shell_scaffold_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MenuButtonLeading extends ConsumerWidget {
  const MenuButtonLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (context.isMobile || context.isSmallTablet || context.isTablet)  {
      return IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: () {
          final state = ref.watch(shellScaffoldKeyProvider).currentState!;
          state.isDrawerOpen 
            ? state.closeDrawer() 
            : state.openDrawer();
        }
      );
    }
    else {
      return const SizedBox.shrink();
    }
  }
}