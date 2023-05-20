import 'package:mobx/mobx.dart';
import 'package:xml_app/repositories/login_repository.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store{
  final LoginRepository _repository;

  _LoginControllerBase(this._repository);
}