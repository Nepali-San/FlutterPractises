import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';

class UserManagement {
  void storeNewUser(user, context) {
    Firestore.instance.collection('/users').add({
      'email': user.email,  
      'uid':user.uid,
    }).then((value) {
      Navigator.pushReplacementNamed(context, '/homePage');
    }).catchError((e) => print(e));
  }
}
