import 'package:firebase_auth/firebase_auth.dart';

// class AppUser {
//   final String? email;
//   final String uid;
//   final String? role;

//   AppUser({
//     this.email, 
//     required this.uid, 
//     this.role
//   });
// }

// extension UserMapper on User {
//   Future<AppUser> toAppUser() async {
//     return AppUser(
//       email: email,
//       uid: uid,
//       role: (await getIdTokenResult()).claims!['role']
//     );
//   }
// }