import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart'; //for Navigator

class UserManagement {
  storeNewUser(user, context) {
    Firestore.instance.collection('/Users').add({
      //'name': user.name,
      'email': user.email,
      'uid': user.uid,
    }).then((value) {
      //Navigator.of(context).pop();
      //Navigator.of(context).pushReplacementNamed('/homePage');
      //Navigator.of(context).pushNamed('/homePage');
    }).catchError((e) {
      print(e);
    });
  }
}
