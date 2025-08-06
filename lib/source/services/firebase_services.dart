import 'package:google_sign_in/google_sign_in.dart';

// mixin FirebaseService {
//   static Future<GoogleSignInAuthentication?> googleAuth() async {
//     // await GoogleSignIn().signOut();
//     // await Future.delayed(Duration.zero);
//     final googleAuth = await GoogleSignIn().signIn();
//     if (googleAuth == null) return null;
//     final res = await googleAuth.authentication;
//     return res;
//   }

 
// }
 mixin FirebaseService {
  static Future<GoogleSignInAuthentication?> googleAuth() async {
    final googleAccount = await GoogleSignIn().signIn();
    if (googleAccount == null) return null;
    return await googleAccount.authentication;
  }
}

