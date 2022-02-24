// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'dart:io';


class ContactListController {

  ContactListController(){
    _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  }


  late final Stream<QuerySnapshot> _usersStream;

  get users=> _usersStream;

  late AsyncSnapshot <QuerySnapshot> snapshot;

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
