import 'package:contact_list/app/modules/contact_list/contact_list_controller.dart';
import 'package:contact_list/app/modules/contact_list/contact_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ContactListController()),
  ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => const ContactListPage()),
 ];
}