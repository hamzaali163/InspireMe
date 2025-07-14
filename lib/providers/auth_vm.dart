import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspire_me/core/utils/general_utils.dart';
import 'package:inspire_me/routes/route_names.dart';

class AuthVm with ChangeNotifier {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final namecontroller = TextEditingController();
  final signUpemailcontroller = TextEditingController();
  final signUppasswordcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;

  bool loginload = false;
  bool sigupload = false;

  void loginloading(bool value) {
    loginload = value;
    notifyListeners();
  }

  void siguploading(bool value) {
    sigupload = value;
    notifyListeners();
  }

  Future signUpuser(context) async {
    siguploading(true);
    await auth
        .createUserWithEmailAndPassword(email: signUpemailcontroller.text, password: signUppasswordcontroller.text)
        .then((value) {
          FirebaseFirestore.instance.collection('user data').doc(auth.currentUser!.uid).set({
            'id': auth.currentUser!.uid.toString(),
            'name': namecontroller.text.toString(),
            'email': signUpemailcontroller.text.toString(),
          });

          siguploading(false);
          notifyListeners();
          Generalutils().successsnackbar("Sign up successful!", context);
          Navigator.pushNamed(context, RouteNames.bottomnav);
        })
        .onError((e, error) {
          Generalutils().errorflushbar(e.toString(), context);
          siguploading(false);
        });
  }

  Future loginuser(context) async {
    loginloading(true);
    await auth
        .signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text)
        .then((value) {
          Generalutils().successsnackbar("Login successful!", context);

          loginloading(false);
          Navigator.pushNamed(context, RouteNames.bottomnav);
        })
        .onError((e, error) {
          Generalutils().errorflushbar(e.toString(), context);
          loginloading(false);
        });
    loginloading(false);
  }
}
