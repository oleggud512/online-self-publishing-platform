import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/features/profile/application/currently_edited_profile.dart';
import 'package:client/src/features/profile/presentation/edit_profile_screen/edit_profile_screen_controller.dart';
import 'package:client/src/features/profile/presentation/edit_profile_widget/edit_profile_widget.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileScreenState();
}
class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editProfileScreenControllerProvider);
    final cont = ref.watch(editProfileScreenControllerProvider.notifier);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(currentlyEditedProfileProvider.select((p) => p.name))),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(p16),
        children: const [
          EditProfileWidget(),
          SizedBox(height: 72)
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () async {
          bool updated = await cont.saveProfile();
          if (context.mounted && updated) {
            context.pop();
          } else {
            ref.watch(scaffoldMessangerStateProvider)
              .showMessage(context.ll!.errors.cannotSave);
          }
        },
        icon: const Icon(Icons.check),
        label: Text(context.ll!.saveChanges)
      ),
    );
  }
}
