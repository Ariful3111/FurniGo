import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:zb_dezign/core/data/global_models/google_user_info_model.dart';

class FirebaseGoogleAuthService {
  static final FirebaseGoogleAuthService _instance =
      FirebaseGoogleAuthService._internal();
  factory FirebaseGoogleAuthService() => _instance;
  FirebaseGoogleAuthService._internal();

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<GoogleUserInfoModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        debugPrint('Google sign-in was cancelled');
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        // Get the Firebase ID token (not the Google OAuth token)
        final idToken = await user.getIdToken();

        final userInfo = GoogleUserInfoModel(
          name: user.displayName ?? googleUser.displayName ?? '',
          email: user.email ?? googleUser.email,
          avatarUrl: user.photoURL ?? googleUser.photoUrl ?? '',
          idToken:
              idToken ??
              '', // Use Firebase ID token instead of Google OAuth token
          uid: user.uid,
        );

        debugPrint('Successfully signed in: ${userInfo.toString()}');
        return userInfo;
      }

      return null;
    } on FirebaseAuthException catch (e) {
      debugPrint('Authentication Error: ${e.message}');
      return null;
    } catch (e) {
      debugPrint('Error signing in: ${e.toString()}');
      return null;
    }
  }

  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      debugPrint('Successfully signed out');
    } catch (e) {
      debugPrint('Error signing out: ${e.toString()}');
    }
  }

  // Helper method to get current user's Firebase ID token
  static Future<String?> getCurrentUserIdToken() async {
    final user = _auth.currentUser;
    if (user != null) {
      return await user.getIdToken();
    }
    return null;
  }
}
