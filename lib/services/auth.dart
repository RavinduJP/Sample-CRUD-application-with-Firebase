import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';  
import 'package:sample_crud/services/firestore.dart';
import 'package:sample_crud/utils/constants/routes.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirestoreService firestoreService = FirestoreService();

  getCurrentUser() async {
    return await auth.currentUser;
  }

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the new page upon successful sign-in
      Navigator.of(context)
          .pushNamed(Routes.homePage); // Replace HomePage with your target page

      // return await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential;
    } on Exception catch (e) {
      // Handle exception
      print('exception->$e');
    }
    return null;
  }

  Future<void> addNoteForCurrentUser(String note) async {
    User? currentUser = auth.currentUser;
    if (currentUser != null) {
      String userId = currentUser.uid;
      await firestoreService.addNote(userId, note);
    } else {
      print('No user signed in');
    }
  }
}
