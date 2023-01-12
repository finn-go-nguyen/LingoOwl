import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../model/auth_user.dart';

final log = Logger();

final authenticationRepositoryProvider =
    Provider<AuthenticationRepository>((ref) {
  return FirebaseAuthenticationRepository(
    FirebaseAuth.instance,
    GoogleSignIn(),
    FacebookAuth.instance,
  );
});

abstract class AuthenticationRepository {
  bool get isSignInWithEmail;
  bool get isSignInWithGoogle;
  bool get isSignInWithFacebook;
  bool get isSignedIn;

  LAuthUser? get currentUser;
  Stream<LAuthUser?> authStateChanges();
  Future<LAuthUser?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<LAuthUser?> signInWithGoogle();
  Future<LAuthUser?> signInWithFacebook();
  Future<LAuthUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();

  Future<void> resetPassword(String email);
  Future<void> changePassword(
    String currentPassword,
    String newPassword,
  );

  Future<void> deleteUser();

  List<String> getUserProviderIds();
}

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  const FirebaseAuthenticationRepository(
    this._firebaseAuth,
    this._googleSignIn,
    this._facebookAuth,
  );

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  @override
  Stream<LAuthUser?> authStateChanges() async* {
    await for (var user in _firebaseAuth.authStateChanges()) {
      if (user == null) {
        yield null;
        log.i('unAuthenticated');
      } else {
        log.i('authenticated');
        yield LAuthUser.fromFirebaseUser(user);
      }
    }
  }

  @override
  Future<void> changePassword(String currentPassword, String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<LAuthUser?> createUserWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  LAuthUser? get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    return LAuthUser.fromFirebaseUser(user);
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  List<String> getUserProviderIds() {
    // TODO: implement getUserProviderIds
    throw UnimplementedError();
  }

  @override
  // TODO: implement isSignInWithEmail
  bool get isSignInWithEmail => throw UnimplementedError();

  @override
  // TODO: implement isSignInWithFacebook
  bool get isSignInWithFacebook => throw UnimplementedError();

  @override
  // TODO: implement isSignInWithGoogle
  bool get isSignInWithGoogle => throw UnimplementedError();

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<LAuthUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user == null) return null;

    return LAuthUser.fromFirebaseUser(credential.user!);
  }

  @override
  Future<LAuthUser?> signInWithFacebook() async {
    // Trigger the sign-in flow
    final loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    return LAuthUser.fromFirebaseUser(userCredential.user!);
  }

  @override
  Future<LAuthUser?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return LAuthUser.fromFirebaseUser(userCredential.user!);
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  @override
  bool get isSignedIn => currentUser != null;
}
