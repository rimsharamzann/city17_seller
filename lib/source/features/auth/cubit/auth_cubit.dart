// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:city17_seller/source/features/auth/models/auth_response.dart';
import 'package:city17_seller/source/features/auth/network/user_repo.dart';
import 'package:city17_seller/source/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    _repo = AuthRepo();
  }

  late AuthRepo _repo;
  Future loginWithEmailPassword(String email, String password) async {
    try {
      emit(AuthLoading(email: true));

      final res = await _repo.loginWithEmailPassword(email, password);
      emit(AuthSuccess(authResponse: res));
    } catch (e) {
      emit(AuthError(message: e.toString()));
      rethrow;
    }
  }

  //3.     state defined in logic
  Future register(String userName, String email, String password) async {
    try {
      emit(AuthLoading(email: true));

      final res = await _repo.register(userName, email, password);
      emit(AuthSuccess(authResponse: res));
    } catch (e) {
      emit(AuthError(message: e.toString()));
      rethrow;
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       print("Google Sign-In aborted");
  //       return;
  //     }

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final idToken = googleAuth.idToken;
  //     final accessToken = googleAuth.accessToken;

  //     if (idToken == null || accessToken == null) {
  //       print("Failed to retrieve tokens");
  //       return;
  //     }

  //     final res = await _repo.login(idToken);

  //     emit(AuthSuccess(authResponse: res));
  //   } catch (e) {
  //     emit(AuthError(message: e.toString()));
  //     rethrow;
  //   }
  // }
  Future signInWithGoogle() async {
    try {
      print('[signInWithGoogle] Starting Google sign-in');

      final googleAuth = await FirebaseService.googleAuth();
      print('[signInWithGoogle] googleAuth: $googleAuth');

      if (googleAuth == null) {
        print('[signInWithGoogle] googleAuth is null. Exiting.');
        return;
      }

      emit(AuthLoading(google: true));
      print('[signInWithGoogle] Emitted AuthLoading');

      final googleAuthProvider = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      print('[signInWithGoogle] Created GoogleAuthProvider credential');

      final userCreds = await FirebaseAuth.instance.signInWithCredential(
        googleAuthProvider,
      );
      print(
        '[signInWithGoogle] Firebase sign-in complete. UserCreds: $userCreds',
      );

      final idToken = await userCreds.user?.getIdToken();
      print('[signInWithGoogle] Fetched ID Token: $idToken');

      if (idToken == null) {
        print('[signInWithGoogle] ID Token is null. Emitting error.');
        emit(AuthError(message: 'ID Token is null'));
        return;
      }

      print('[signInWithGoogle] Calling _repo.login with ID Token');
      final res = await _repo.login(idToken);
      print('[signInWithGoogle] Login response: $res');

      emit(AuthSuccess(authResponse: res));
      print('[signInWithGoogle] Emitted AuthSuccess');
    } catch (e, stack) {
      print('[signInWithGoogle] Error occurred: $e');
      print('[signInWithGoogle] Stack trace: $stack');
      emit(AuthError(message: e.toString()));
      rethrow;
    }
  }
}
