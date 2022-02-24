// ignore_for_file: unnecessary_this

import 'package:contact_list/app/modules/contact_list/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactListPage extends StatefulWidget {
  final String title;
  const ContactListPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState
    extends ModularState<ContactListPage, ContactListController> {
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contact list"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: controller.users,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Loading"));
              }

              if (snapshot.hasError) {
                return Center(child: const Text('Something went wrong'));
              }

              if (snapshot.hasData) {
                return customContactCard(snapshot);
              }
              return Container(
                  width: this.width,
                  height: this.height,
                  color: Colors.red,
                  child: const Text("No data"));
            }),
      ),
    );
  }

  Widget customContactCard(AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 16, vertical: height / 32),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5.0)),
              width: this.width / 8,
              height: this.height / 6,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Full name: ${data['full_name']} "),
                    Text("Cellphone ${data['cellphone']}"),
                    Text("Age: ${data['age']}"),
                  ],
                ),
              )),
        );
      }).toList(),
    );
  }
}
