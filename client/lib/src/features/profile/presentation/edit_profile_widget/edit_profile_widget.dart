import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/features/profile/presentation/edit_profile_widget/edit_profile_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/utils/debounce.dart';
import '../../../../common/widgets/description_form_field.dart';
import '../../../../common/widgets/my_image.dart';
import '../../domain/profile.dart';

class EditProfileWidget extends ConsumerStatefulWidget {
  const EditProfileWidget({super.key, this.isAuth = false});

  final bool isAuth;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileWidgetState();
}
class _EditProfileWidgetState extends ConsumerState<EditProfileWidget> {
  final nameDebouncer = Debouncer();

  final formFieldKey = GlobalKey<FormFieldState>();

  void nameChanged(String newName) {
    nameDebouncer.debounce(
      () => ref.watch(editProfileWidgetControllerProvider.notifier)
        .updateName(newName)
    );
  }

  void ageChanged(int newAge) {

  }

  void displayNameChanged(String newDisplayName) {

  }

  void descriptionChanged(String newDescription) {

  }

  void genderChanged(Gender newGender) {

  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editProfileWidgetControllerProvider);
    final cont = ref.watch(editProfileWidgetControllerProvider.notifier);
    final profile = state.profile;
    printInfo(state.isUniqueName);
    formFieldKey.currentState?.validate();
    printInfo(state.isUniqueName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!widget.isAuth) ...[
          Center(
            child: MyImage(
              onTap: () {
                cont.chooseImage();
              },
              size: const Size(160, 176),
              imageUrl: profile.avatarUrl,
            ),
          ),
          h16gap,
        ],
        TextFormField(
          key: formFieldKey,
          maxLength: 80,
          initialValue: profile.name,
          decoration: InputDecoration(
            labelText: context.ll!.name,
          ),
          onChanged: nameChanged,
          validator: (s) {
            if (ref.watch(editProfileWidgetControllerProvider).isUniqueName) {
              printInfo('This name is unique');
              return null;
            } 
            printInfo("This name is already taken");
            return "This name is already taken";
          },
        ),
        h16gap,
        TextFormField(
          initialValue: profile.displayName,
          maxLength: 80,
          decoration: InputDecoration(
            labelText: context.ll!.displayName,
          ),
          onChanged: (newV) {
            cont.displayName = newV;
          }
        ),
        h16gap,
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: TextFormField(
        //         initialValue: (profile.age ?? 0).toString(), 
        //         maxLength: 3,
        //         keyboardType: TextInputType.number,
        //         decoration: InputDecoration(
        //           labelText: context.ll!.auth.age,
        //         ),
        //         onChanged: (newV) {
        //           cont.age = int.tryParse(newV, radix: 10);
        //         }
        //       ),
        //     ),
        //     w16gap,
        //     Expanded(
        //       child: DropdownButtonFormField<Gender>(
        //         decoration: InputDecoration(
        //           labelText: context.ll!.auth.gender,
        //         ),
        //         isExpanded: true,
        //         value: profile.gender,
        //         items: [
        //           DropdownMenuItem<Gender>(
        //             value: Gender.preferNotToSay,
        //             child: Text(context.ll!.auth.genders.preferNotToSay),
        //           ),
        //           DropdownMenuItem<Gender>(
        //             value: Gender.other,
        //             child: Text(context.ll!.auth.genders.other),
        //           ),
        //           DropdownMenuItem<Gender>(
        //             value: Gender.m,
        //             child: Text(context.ll!.auth.genders.male),
        //           ),
        //           DropdownMenuItem<Gender>(
        //             value: Gender.f,
        //             child: Text(context.ll!.auth.genders.female),
        //           ),
        //         ], 
        //         onChanged: (newV) {
        //           cont.gender = newV!;
        //         }
        //       ),
        //     ),
        //   ]
        // ),
        if (!widget.isAuth) ...[
            h16gap,
            DescriptionFormField(
              initialValue: profile.description,
              onChanged: (v) {
                cont.description = v;
              },
            ),
          ],
        // Text(profile.toJson().toString())
      ]
    );
  }
}
