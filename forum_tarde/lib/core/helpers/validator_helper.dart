import 'cpf_validator.dart';

class ValidatorHelper {
  const ValidatorHelper._();

  static bool isValidPhone(String numberPhone) {
    final pattern =
        r'(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(numberPhone);
  }

  static bool isValidEmail(String email) {
    final pattern =
        r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final pattern = r'.{6,}';
    final regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  static bool isValidCep(String cep) {
    final regex = RegExp(r'[0-9]{5}-[0-9]{3}$');
    return regex.hasMatch(cep);
  }

  static bool isValidCpf(String cpf) {
    return CpfValidator.isValid(
      cpf.replaceAll('.', '').replaceAll('-', ''),
    );
  }
}
