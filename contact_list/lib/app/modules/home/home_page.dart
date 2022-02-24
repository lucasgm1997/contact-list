import 'package:contact_list/app/core/constants.dart';
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

  late double width;
  late double height;

  @override
  void initState() {
    //clears firebase cache
    controller.firebaseSettings();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Add new contact'),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  usersInput(),
                  SizedBox(
                    height: height / 16,
                  ),
                  nextPage(),
                  SizedBox(
                    height: height / 16,
                  ),
                  addNewUserButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget usersInput() {
    return Column(
      children: [
        TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: controller.setFullName,
          controller: controller.fullNameTxtEdtCtrl,
          decoration: const InputDecoration(
            hintText: "Full name",
          ),
          validator: controller.fullNameValidator,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: controller.setCellphone,
          controller: controller.cellphoneTxtEdtCtrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "Cellphone",
          ),
          validator: controller.cellphoneValidator,
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          onChanged: controller.setAge,
          controller: controller.ageTxtEdtCtrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "Age",
          ),
          validator: controller.ageValidator,
        ),
      ],
    );
  }

  Widget nextPage() {
    return Center(
      child: InkWell(
        onTap: ()=>Modular.to.pushNamed(CONTACTLISTROUTE),
        child: Container(
          color: Colors.blue,
          width: width,
          height: height / 8,
          child: const Center(child: Text('Go to contact list')),
        ),
      ),
    );
  }

  Widget addNewUserButton() {
    return Container(
      width: width,
      height: height / 8,
      color: Colors.blue,
      child: TextButton(
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {

            await controller.internetVerification().then((value) {

              if (controller.isWithInternet) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User added')),);
                controller.addUser();
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No connection')),);
              }
              
            });
          }
        },
        child: const Text(
          "Add new user",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
