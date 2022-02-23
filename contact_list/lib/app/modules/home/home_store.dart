import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_core/firebase_core.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  Future<void> initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}