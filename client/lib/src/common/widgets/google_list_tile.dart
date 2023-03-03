import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'my_avatar.dart';

class GoogleListTile extends StatelessWidget {
  const GoogleListTile({
    super.key, 
    this.googleSignInAccount,
    this.onRemove
  });

  final void Function()? onRemove;
  final GoogleSignInAccount? googleSignInAccount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(googleSignInAccount!.displayName ?? ""),
      subtitle: Text(googleSignInAccount!.email),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          if (onRemove != null) onRemove!();
        }
      ),
      leading: MyAvatar(url: googleSignInAccount!.photoUrl ?? "")
    );
  }
}