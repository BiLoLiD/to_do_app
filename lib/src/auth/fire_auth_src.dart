import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/model/user_model.dart';
import 'package:to_do_app/src/firestore/firestore_db.dart';
import 'package:to_do_app/src/prefs/prefs.dart';

class FireAuth {
  static final _firabseAuth = FirebaseAuth.instance;

  static Future<UserCredential?> signUp(
      {required String? email,
      required String? password,
      required String? name}) async {
    try {
      final UserCredential credentional = await _firabseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      UserModel? user = UserModel(
          uid: credentional.user!.uid,
          username: email,
          name: name,
          email: email,
          taskNames: ['important', 'tasks'],
          datePublished: DateTime.now(),
          password: password);
      final saveUserToYourDb = await FirestoreDb.saveUser(userData: user);
      final uidSavedToLocal = await Prefs.saveUid(uid: credentional.user!.uid);
      if (saveUserToYourDb! && uidSavedToLocal!) {
        return credentional;
      }
    } on FirebaseException {
      log('Firebase Exception');
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<UserCredential?> login({
    required String? email,
    required String? password,
  }) async {
    try {
      final credential = await _firabseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      final savedToLocal = await Prefs.saveUid(uid: credential.user!.uid);
      if (credential.user != null && savedToLocal!) {
        return credential;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<UserModel?> get currentUser async {
    try {
      var userDocument = await FirestoreDb.firestore
          .collection('users')
          .doc(_firabseAuth.currentUser!.uid)
          .get();
      var dataJson = userDocument.data();
      UserModel? user = UserModel.fromJson(dataJson!);
      return user;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static FirebaseAuth get auth => _firabseAuth;
}
