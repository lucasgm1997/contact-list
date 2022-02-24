import 'package:contact_list/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  // The validator receives the text that the user has entered.
                  onChanged: controller.setFullName,
                  decoration: const InputDecoration(
                    hintText: "Full name",
                  ),
                  validator: controller.fullNameValidator,
                ),

                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
                TextField(
                  onChanged: controller.setFullName,
                  decoration: const InputDecoration(
                    hintText: "Full name",
                  ),
                  controller: controller.fullNameTxtEdtCtrl,
                ),
                TextField(
                  onChanged: controller.setAge,
                  decoration: const InputDecoration(
                    hintText: "Age",
                  ),
                  controller: controller.ageTxtEdtCtrl,
                ),
                TextField(
                  onChanged: controller.setCellphone,
                  decoration: const InputDecoration(
                    hintText: "Cellphone",
                  ),
                  controller: controller.cellphoneTxtEdtCtrl,
                ),
                TextButton(
                  onPressed: controller.addUser,
                  child: const Text(
                    "Add User",
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
