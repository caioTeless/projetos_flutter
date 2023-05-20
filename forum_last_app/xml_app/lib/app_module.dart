import 'package:flutter_modular/flutter_modular.dart';

import 'login_module.dart';

class AppModule extends Module{
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    //ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/login', module: LoginModule()),
    //ModuleRoute('/register', module: LoginModule()),
    //ModuleRoute('/forget-password', module: forgetPasswordModule()),
    //ModuleRoute('/home', module: LoginModule()),
  ];
}