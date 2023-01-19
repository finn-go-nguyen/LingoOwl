import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/authentication/data/authentication_repository.dart';
import 'features/profile/data/user_repository.dart';

class DomainManager {
  static DomainManager? _instance;

  DomainManager._();

  static DomainManager get instance => _instance ??= DomainManager._();

  late final authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
    return FirebaseAuthenticationRepository(
      FirebaseAuth.instance,
      GoogleSignIn(),
      FacebookAuth.instance,
    );
  });

  late final userRepositoryProvider = Provider<UserRepository>((ref) {
    return FirestoreUserRepository(FirebaseFirestore.instance);
  });
}
