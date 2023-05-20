import 'package:flutter_modular/flutter_modular.dart';
import 'modules/login/pages/login_page.dart';

class LoginModule extends Module{
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => LoginPage()),
  ];
}