import 'package:dartz/dartz.dart';
import 'package:forum_tarde/core/config/app_errors.dart';
import 'package:forum_tarde/modules/login/models/credential_model.dart';
import 'package:forum_tarde/modules/login/models/user_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginRepository {
  Future<Either<Failure, UserModel>> login(CredentialModel credential) async {
    try {
      final user = ParseUser(
        credential.email.trim(),
        credential.password.trim(),
        credential.email.trim(),
      );

      final response = await user.login();
      if (response.success) {
        final result = UserModel.fromMap(response.results!.first);
        return Right(result);
      }
      return Left(ApiError('Email ou senha inválido!'));
    } on Exception catch (error) {
      return Left(ApiError(error.toString()));
    }
  }
}
