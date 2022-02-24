import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class HomeController {
  HomeController() {
    users = FirebaseFirestore.instance.collection('users');
  }

  Future<void> firebaseSettings() async {
    await FirebaseFirestore.instance.terminate();
    await FirebaseFirestore.instance.clearPersistence();
  }

  late CollectionReference users;

  late String _fullName;
  late int _age;
  late String _cellphone;
  final formKey = GlobalKey<FormState>();

  bool isDataLoaded = false;

  TextEditingController fullNameTxtEdtCtrl = TextEditingController();
  TextEditingController ageTxtEdtCtrl = TextEditingController();
  TextEditingController cellphoneTxtEdtCtrl = TextEditingController();

  setFullName(String value) => _fullName = value;
  setAge(String value) => _age = int.parse(value);
  setCellphone(String value) => _cellphone = value;

  Future<void> addUser() async {
    users.add({
          'full_name': _fullName,
          'age': _age,
          'cellphone': _cellphone,
        })
        .then((value) => print("User added"))
        .catchError((error) => print("Failed to add user: $error"));

    cleanFields();
  }

  void cleanFields() {
    fullNameTxtEdtCtrl.text = "";
    _fullName = '';
    ageTxtEdtCtrl.text = "";
    _age = 0;
    cellphoneTxtEdtCtrl.text = "";
    _cellphone = '';
  }

  String? fullNameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Insert your full name';
    }
    return null;
  }

  String? ageValidator(value) {
    if (value == null || value.isEmpty || int.parse(value) <= 0) {
      return 'Insert your age';
    }
    return null;
  }

  String? cellphoneValidator(value) {
    if (value == null || value.isEmpty || int.parse(value) <= 0) {
      return 'Insert your cellphone';
    }
    return null;
  }

  bool isWithInternet = false;

  Future<void> internetVerification() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isWithInternet = true;
      }
    } on SocketException catch (_) {
      isWithInternet = false;
    }
  }
}
