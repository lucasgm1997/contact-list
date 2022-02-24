import 'package:contact_list/app/core/constants.dart';
import 'package:contact_list/app/modules/contact_list/contact_list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(CONTACTLISTROUTE, module: ContactListModule()),
  ];

}