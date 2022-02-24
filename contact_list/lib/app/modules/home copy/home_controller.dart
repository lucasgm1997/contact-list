import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  HomeController() {
    users = FirebaseFirestore.instance.collection('users');
  }

  late CollectionReference users;

  late String _fullName;
  late int _age;
  late String _cellphone;

  TextEditingController fullNameTxtEdtCtrl = TextEditingController();
  TextEditingController ageTxtEdtCtrl = TextEditingController();
  TextEditingController cellphoneTxtEdtCtrl = TextEditingController();

  setFullName(String value) => _fullName = value;
  setAge(String value) => _age = int.parse(value);
  setCellphone(String value) => _cellphone = value;

  Future<void> addUser() {
    users = FirebaseFirestore.instance.collection('users');
    return users
        .add({
          'full_name': _fullName,
          'age': _age,
          'cellphone': _cellphone,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  String fullNameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return '';
  }

  
}
